$ErrorActionPreference = 'Stop'
$candidates = @(
    (Join-Path $env:LOCALAPPDATA 'agy\bin\agy.exe'),
    (Join-Path $env:LOCALAPPDATA 'Microsoft\WinGet\Packages\Google.AntigravityCLI_Microsoft.Winget.Source_8wekyb3d8bbwe\agy.exe')
)
$agyPath = $candidates | Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } | Select-Object -First 1
if (-not $agyPath) { throw 'agy.exe was not found.' }
& $agyPath --help
if ($LASTEXITCODE -ne 0) { throw ('agy --help failed with exit code ' + $LASTEXITCODE) }
