#! /bin/bash

# ~/.zshrc or ~/.config/zsh/pkg_manager_detection.zsh
# --------------------------------------------------
# Auto-detect npm vs pnpm in monorepos by climbing parent dirs
# - cache last discovered project root to avoid repeated climbs
# - stop climbing at VCS root (.git)
# Set PKG_MANAGER accordingly on every `cd`.

# 1. find lockfile, stopping at VCS root
find_lockfile_in_parents() {
  # echo "4. Running: find_lockfile_in_parents()"
  local dir lockfile
  dir="$PWD"

  # echo "5. Current dir: $dir"
  while [[ "$dir" != "/" ]]; do
    # echo "6. Looping -> dir=$dir"
    for lockfile in "$@"; do
      # echo "7. Looping -> lockfile=$lockfile"
      if [[ -e "$dir/$lockfile" ]]; then
        # echo "$dir/$lockfile"
        LOCKFILE="$dir/$lockfile"
        # echo "8. Lock file detected -> $LOCKFILE"
        return 0
      fi
    done

    # if we hit a VCS root, stop climbing
    if [[ -e "$dir/.git" ]]; then
      # echo "9. .git folder found. Breaking the loop..."
      break
    fi

    dir=$(dirname "$dir")
    # echo "10. Current dir=$dir"
  done

  return 1
}

# 2. detect and cache pkg manager
detect_pkg_manager() {
  # echo "1. Running: detect_pkg_manager()"
  local lockpath manager

  # use cache if still inside the same project root
  if [[ -n "$PKG_PROJECT_ROOT" && "$PWD" == "$PKG_PROJECT_ROOT"* ]]; then
    # echo "1.1. From cache"
    lockpath="$PKG_PROJECT_LOCKPATH"
  else
    unset PKG_PROJECT_ROOT
    unset PKG_PROJECT_LOCKPATH
    unset LOCKFILE

    if find_lockfile_in_parents pnpm-lock.yaml package-lock.json; then
      lockpath="$LOCKFILE"
      PKG_PROJECT_LOCKPATH="$lockpath"
      PKG_PROJECT_ROOT="${lockpath%/*}"
      # echo "1.2. Set lockpath: $lockpath"
    fi
  fi

  [[ -n "$lockpath" && "${lockpath##*/}" == "package-lock.json" ]] && manager="npm"
  [[ -n "$lockpath" && "${lockpath##*/}" == "pnpm-lock.yaml" ]] && manager="pnpm"
  [[ -n "$lockpath" && "${lockpath##*/}" == "yarn.lock" ]] && manager="yarn"

  # echo "2. PKG_MANAGER=$PKG_MANAGER manager=$manager"

  # export only if changed
  if [[ "$PKG_MANAGER" != "$manager" ]]; then
    export PKG_MANAGER="$manager"
    # echo "3. PKG_MANAGER=$PKG_MANAGER"
  fi
}

# 3. hook into directory changes
autoload -Uz add-zsh-hook
add-zsh-hook chpwd detect_pkg_manager

# 4. initial run
# echo "0. Starting pkg manager detection..."
detect_pkg_manager
# echo "Detection complete."
