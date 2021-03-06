################################################################################
##  File:  Install-Mingw64.ps1
##  Desc:  Install GNU tools for Windows
################################################################################

Choco-Install -PackageName mingw

# Make a copy of mingw32-make.exe to make.exe, which is a more discoverable name
# and so the same command line can be used on Windows as on macOS and Linux
$path = Get-Command mingw32-make.exe -CommandType All | Where-Object { $_.Path.Contains("C:\ProgramData\Chocolatey") } | Get-Item
Copy-Item -Path $path -Destination (Join-Path $path.Directory 'make.exe')

Invoke-PesterTests -TestFile "Tools" -TestName "Mingw64"
