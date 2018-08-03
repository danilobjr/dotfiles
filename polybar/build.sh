#!/usr/bin/env bash

function msg_err {
  printf "\033[31;1m** \033[0m%s\n" "$@"
  exit 1
}

function msg {
  printf "\033[32;1m** \033[0m%s\n" "$@"
}

function main
{
  [[ -d ./.git ]] && {
    msg "Fetching submodules"
    git submodule update --init --recursive || msg_err "Failed to clone submodules"
  }

  [[ -d ./build ]] && {
    if [[ "$1" == "-f" ]]; then
      msg "Removing existing build dir (-f)"
      rm -rf ./build >/dev/null || msg_err "Failed to remove existing build dir"
    else
      msg_err "A build dir already exists (pass -f to replace)"
    fi
  }

  mkdir ./build || msg_err "Failed to create build dir"
  cd ./build || msg_err "Failed to enter build dir"

  local build_ipc_msg="ON"
  local enable_alsa="ON"
  local enable_pulseaudio="ON"
  local enable_i3="ON"
  local enable_network="ON"
  local enable_mpd="ON"
  local enable_curl="ON"

  msg "Setting build options"

  read -r -p "$(msg "Use GCC even if Clang is installed ----------------------------- [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && try_to_use_clang="ON"
  read -r -p "$(msg "Include support for \"internal/i3\" (requires i3) ---------------- [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && enable_i3="OFF"
  read -r -p "$(msg "Include support for \"internal/alsa\" (requires alsalib) --------- [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && enable_alsa="OFF"
  read -r -p "$(msg "Include support for \"internal/pulseaudio\" (requires libpulse) -- [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && enable_pulseaudio="OFF"
  read -r -p "$(msg "Include support for \"internal/network\" (requires libnl/libiw) -- [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && enable_network="OFF"
  read -r -p "$(msg "Include support for \"internal/mpd\" (requires libmpdclient) ----- [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && enable_mpd="OFF"
  read -r -p "$(msg "Include support for \"internal/github\" (requires libcurl) ------- [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && enable_curl="OFF"
  read -r -p "$(msg "Build \"polybar-msg\" used to send ipc messages ------------------ [y/N]: ")" -n 1 p && echo
  [[ "${p^^}" != "Y" ]] && build_ipc_msg="OFF"

  local cxx="c++"
  local cc="cc"

  if [[ "${try_to_use_clang}" == "ON" ]]; then
    if command -v clang++ >/dev/null; then
      msg "Using compiler: clang++/clang"
      cxx="clang++"
      cc="clang"
    elif command -v g++ >/dev/null; then
      msg "Using compiler: g++/gcc"
      cxx="g++"
      cc="gcc"
    fi
  else
      cxx="g++"
      cc="gcc"
  fi

  msg "Executing cmake command"
  cmake                                       \
    -DCMAKE_C_COMPILER="${cc}"                \
    -DCMAKE_CXX_COMPILER="${cxx}"             \
    -DENABLE_ALSA:BOOL="${enable_alsa}"       \
    -DENABLE_PULSEAUDIO:BOOL="${enable_pulseaudio}"\
    -DENABLE_I3:BOOL="${enable_i3}"           \
    -DENABLE_MPD:BOOL="${enable_mpd}"         \
    -DENABLE_NETWORK:BOOL="${enable_network}" \
    -DENABLE_CURL:BOOL="${enable_curl}"       \
    -DBUILD_IPC_MSG:BOOL="${build_ipc_msg}"   \
    .. || msg_err "Failed to generate build... read output to get a hint of what went wrong"

  msg "Building project"
  make || msg_err "Failed to build project"

  sudo make install || msg_err "Failed to install executables..."
  make userconfig || msg_err "Failed to install user configuration..."

  msg "Build complete!"

  exit 0
}

main "$@"
