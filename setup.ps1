Function Test-CommandNotExists
{
    Param ($command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = ‘stop’
    try { if (Get-Command $command) { RETURN $false } }
    Catch { RETURN $true }
    Finally { $ErrorActionPreference = $oldPreference }

} #end function test-CommandExists

If(Test-CommandNotExists scoop) {
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}
If(Test-CommandNotExists aria2c) {
    scoop install aria2
}
If(Test-CommandNotExists git) {
    scoop install git
}
$configGit = ''
while (-not($configGit.StartsWith('y')) -and -not($configGit.StartsWith('n'))) {
    $configGit = Read-Host "Configure git username/email (y/n)"
}
if($configGit.StartsWith('y')) {
    $name = Read-Host "Please enter your git name"
    $email = Read-Host "Please enter your git email"
    git config --global user.name "$name"
    git config --global user.email "$email"
}
scoop install oh-my-posh
if(-Not(Test-Path -Path $PROFILE)) {
    New-Item -Path $PROFILE -ItemType File -Force
}
Copy-Item "$(scoop prefix oh-my-posh)\themes\robbyrussell.omp.json" "~/robbyrussell.omp.json"
Write-Output @"
oh-my-posh --init --shell pwsh --config ~/robbyrussell.omp.json | Invoke-Expression
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
"@ > $PROFILE

Invoke-Expression $PROFILE
