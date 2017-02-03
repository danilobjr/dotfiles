# modules
# =======

Import-Module git
Import-Module psake

# start
# =====

Push-Location C:\dev\repos\

# alias
# =====

New-Alias reload! Reload-Profile
New-Alias repos Goto-Repos
New-Alias .. Up-FolderLevel
New-Alias ~ Goto-HomeFolder
New-Alias psprofile Goto-PSProfile
New-Alias modulesfolder Goto-ModulesFolder

# colors
# ======

[System.Console]::ForegroundColor = "White"
[System.Console]::BackgroundColor = "Black"

# functions
# =========

function Reload-Profile { & $profile }
function Goto-Repos { & Set-Location C:\dev\repos }
function Up-FolderLevel { & Set-Location .. } 
function Goto-HomeFolder { & Set-Location $home } 
function Goto-PSProfile { & Invoke-Item "$($env:PSModulePath.split(';')[0].replace('\Modules', ''))\Microsoft.PowerShell_profile.ps1" } 
function Goto-ModulesFolder { & Invoke-Item $env:PSModulePath.split(';')[0] } 
