# onRemove
# ========

$oldPrompt = Get-Content function:prompt -ErrorAction SilentlyContinue

$MyInvocation.MyCommand.ScriptBlock.Module.onRemove = {
    Set-Content Function:prompt -Value $oldPrompt
}

# aliases
# =======

# removing default aliases from global and local scopes
if (Test-Path alias:gcm) { Remove-Item alias:gcm -Force } 
if (Test-Path alias:gcm) { Remove-Item alias:gcm -Force } 
if (Test-Path alias:gm) { Remove-Item alias:gm -Force } 
if (Test-Path alias:gm) { Remove-Item alias:gm -Force } 

# git
New-Alias -Name gs -Value GitStatus
New-Alias -Name gd -Value GitDiff
New-Alias -Name ga -Value GitAdd
New-Alias -Name gaa -Value GitAddAll
New-Alias -Name gcm -Value GitCommit
New-Alias -Name gpullo -Value GitPullOrigin
New-Alias -Name gpusho -Value GitPushOrigin
New-Alias -Name gunstage -Value GitUnstage
New-Alias -Name gundo -Value GitUndo
New-Alias -Name gco -Value GitCheckOut
New-Alias -Name gb -Value GitBranch
New-Alias -Name gcl -Value GitClone
New-Alias -Name gm -Value GitMerge
New-Alias -Name gr -Value GitRebase
New-Alias -Name grc -Value GitRebaseContinue
New-Alias -Name glast -Value GitLastCommit
New-Alias -Name ghist -Value GitHist

# git-flow
New-Alias -Name gfi -Value GitFlowInit
New-Alias -Name gfid -Value GitFlowInitDefault
New-Alias -Name gff -Value GitFlowFinish
New-Alias -Name gfp -Value GitFlowPublish
New-Alias -Name gfd -Value GitFlowDelete
New-Alias -Name gffs -Value GitFlowFeatureStart
New-Alias -Name gfff -Value GitFlowFeatureFinish
New-Alias -Name gffp -Value GitFlowFeaturePublish
New-Alias -Name gfft -Value GitFlowFeatureTrack
New-Alias -Name gfrs -Value GitFlowReleaseStart
New-Alias -Name gfrf -Value GitFlowReleaseFinish
New-Alias -Name gfrp -Value GitFlowReleasePublish
New-Alias -Name gfrt -Value GitFlowReleaseTrack
New-Alias -Name gfhs -Value GitFlowHotfixStart
New-Alias -Name gfhf -Value GitFlowHotfixFinish
New-Alias -Name gfhp -Value GitFlowHotfixPublish
New-Alias -Name gfht -Value GitFlowHotfixTrack
New-Alias -Name gfbs -Value GitFlowBugfixStart
New-Alias -Name gfbf -Value GitFlowBugfixFinish
New-Alias -Name gfbp -Value GitFlowBugfixPublish
New-Alias -Name gfbt -Value GitFlowBugfixTrack

# functions
# =========

# git-flow
function GitFlowInit { git fi }
function GitFlowInitDefault { git fid }

function GitFlowFinish { git ff }
function GitFlowPublish { git fp }
function GitFlowDelete { git fd }

function GitFlowFeatureStart { git ffs $args }
function GitFlowFeatureFinish { git fff $args }
function GitFlowFeaturePublish { git ffp $args }
function GitFlowFeatureTrack { git ffp $args }

function GitFlowReleaseStart { git frs $args }
function GitFlowReleaseFinish { git frf $args }
function GitFlowReleasePublish { git frp $args }
function GitFlowReleaseTrack { git frp $args }

function GitFlowHotfixStart { git fhs $args }
function GitFlowHotfixFinish { git fhf $args }
function GitFlowHotfixPublish { git fhp $args }
function GitFlowHotfixTrack { git fhp $args }

function GitFlowBugfixStart { git fbs $args }
function GitFlowBugfixFinish { git fbf $args }
function GitFlowBugfixPublish { git fbp $args }
function GitFlowBugfixTrack { git fbp $args }

# git
function GitDiff { git d *$args* }
function GitAdd { git a *$args* }
function GitAddAll { git aa }
function GitCommit { git cm $args }
function GitPullOrigin { git pull origin $args }
function GitPushOrigin { git push origin $args }
function GitUnstage { git reset HEAD -- $args }
function GitUndo($howManyCommits = 1) { git reset HEAD~$howManyCommits }
function GitCheckOut { git co $args }
function GitBranch { git br $args }
function GitClone { git cl $args }
function GitMerge { git m $args }
function GitRebase { git r $args }
function GitRebaseContinue { git rc }
function GitLastCommit { git last }
function GitHist { git hist }

function GitStatus {
    param (
        [switch] $Modified = $false,
        [switch] $Added = $false,
        [switch] $Deleted = $false,
        [switch] $Renamed = $false,
        [switch] $Untracked = $false
    )

    $statusLetter = ""

    if ($Modified) {
        $statusLetter = 'M'
    }

    if ($Added) {
        $statusLetter = 'A'
    }

    if ($Deleted) {
        $statusLetter = 'D'
    }

    if ($Renamed) {
        $statusLetter = 'R'
    }

    if ($Untracked) {
        $statusLetter = '\?'
    }

    if ($Modified -or $Added -or $Deleted -or $Renamed -or $Untracked) {
        git status -s | 
            Where-Object { $_ -match "(^$statusLetter+)|(^\s$statusLetter)" } |
            ForEach-Object { $commaSeparated = $_ -replace '(?!^\s+)\s+', ','; $commaSeparated.split(',')[1] }  
    } else {
        git status -sb
    }
}

# custom prompt
# =============

function global:prompt {
    $symbolicRef = [string](git symbolic-ref HEAD)

    if ($symbolicRef -ne $null) {
        $branch = $symbolicRef.Substring(11)
    }

    Write-Host

    Write-Host "$env:USERNAME@$env:USERDOMAIN " -ForegroundColor Green -NoNewline
    Write-Host "$pwd " -ForegroundColor Yellow -NoNewline

    if ($branch) {
        $groupedStatuses = gs | ForEach-Object { $_ -replace '(?!^\s+)\s+', ',' } | ConvertFrom-Csv -Header Status, Path | Group-Object Status

        $modifiedAmount = $groupedStatuses | Where-Object { $_.Name.Contains('M') } | Select-Object -ExpandProperty Count
        $addedAmount = $groupedStatuses | Where-Object { $_.Name.Contains('A') } | Select-Object -ExpandProperty Count
        $deletedAmount = $groupedStatuses | Where-Object { $_.Name.Contains('D') } | Select-Object -ExpandProperty Count
        $renamedAmount = $groupedStatuses | Where-Object { $_.Name.Contains('R') } | Select-Object -ExpandProperty Count
        #$copiedAmount = $groupedStatuses | Where-Object { $_.Name -eq 'C' } | Select-Object -ExpandProperty Count
        #$updatedButUnmergedAmount = $groupedStatuses | Where-Object { $_.Name -eq 'U' } | Select-Object -ExpandProperty Count
        $untrackedAmount = $groupedStatuses | Where-Object { $_.Name.Contains('?') } | Select-Object -ExpandProperty Count

        $statusesAmount = @($modifiedAmount, $addedAmount, $deletedAmount, $renamedAmount, $untrackedAmount)

        $someStatusIsPedding = $false

        foreach ($status in $statusesAmount) {
            if ($status -gt 0) {
                $someStatusIsPedding = $true
            }
        }

        if ($someStatusIsPedding) {
            Write-Host "[ " -NoNewline

            if ($modifiedAmount) {
                Write-Host "$modifiedAmount " -ForegroundColor Green -NoNewline
            }

            if ($addedAmount) {
                Write-Host "+$addedAmount " -ForegroundColor Yellow -NoNewline
            }

            if ($deletedAmount) {
                Write-Host "-$deletedAmount " -ForegroundColor Magenta -NoNewline
            }

            if ($renamedAmount) {
                Write-Host "r$renamedAmount " -ForegroundColor Blue -NoNewline
            }

            if ($untrackedAmount) {
                Write-Host "?$untrackedAmount " -ForegroundColor Red -NoNewline
            }

            Write-Host "] " -NoNewline
        }

        Write-Host "($branch) " -ForegroundColor Cyan -NoNewline
    }

    write-host

    '> '
}
