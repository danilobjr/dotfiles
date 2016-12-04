# modules
# =======

Import-Module git

# start
# =====

Push-Location C:\dev\repos\

# alias
# =====

New-Alias reload! Reload-Profile
New-Alias repos Goto-Repos
New-Alias .. Up-FolderLevel
New-Alias ~ Goto-HomeFolder

# colors
# ======

[System.Console]::ForegroundColor = "White"
[System.Console]::BackgroundColor = "Black"

# functions
# =========

function Reload-Profile { & $profile }
function Goto-Repos { cd C:\dev\repos }
function Up-FolderLevel { cd .. } 
function Goto-HomeFolder { cd $home } 