$ErrorActionPreference = 'Stop'
$work = 'C:\GoogleDrive\AI\tools\ai-bridge\work'
$python = (Get-Command python -ErrorAction Stop).Source
$agyCandidates = @(
    (Join-Path $env:LOCALAPPDATA 'agy\bin\agy.exe'),
    (Join-Path $env:LOCALAPPDATA 'Microsoft\WinGet\Packages\Google.AntigravityCLI_Microsoft.Winget.Source_8wekyb3d8bbwe\agy.exe')
)
$agy = $agyCandidates | Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } | Select-Object -First 1
if (-not $agy) { throw 'agy.exe was not found.' }
& $agy --version
if ($LASTEXITCODE -ne 0) { throw ('agy --version failed with exit code ' + $LASTEXITCODE) }
$envNames = @('GEMINI_API_KEY', 'GOOGLE_API_KEY', 'ANTHROPIC_API_KEY', 'OPENAI_API_KEY')
foreach ($envName in $envNames) {
    $present = -not [string]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable($envName, 'Process'))
    Write-Output ($envName + '_PRESENT=' + $present.ToString().ToLowerInvariant())
}
& $python -X utf8 -m py_compile (Join-Path $work 'antigravity_auto.py') (Join-Path $work 'ag_job_runner.py') (Join-Path $work 'test_antigravity_session_contract.py') (Join-Path $work 'test_ag_job_recovery.py')
if ($LASTEXITCODE -ne 0) { throw ('py_compile failed with exit code ' + $LASTEXITCODE) }
& $python -X utf8 (Join-Path $work 'test_antigravity_session_contract.py')
if ($LASTEXITCODE -ne 0) { throw ('test_antigravity_session_contract.py failed with exit code ' + $LASTEXITCODE) }
& $python -X utf8 (Join-Path $work 'test_ag_job_recovery.py')
if ($LASTEXITCODE -ne 0) { throw ('test_ag_job_recovery.py failed with exit code ' + $LASTEXITCODE) }
& $python -X utf8 (Join-Path $work 'test_ai_bridge_incident.py')
if ($LASTEXITCODE -ne 0) { throw ('test_ai_bridge_incident.py failed with exit code ' + $LASTEXITCODE) }
& $python -X utf8 (Join-Path $work 'test_background_process_contract.py')
if ($LASTEXITCODE -ne 0) { throw ('test_background_process_contract.py failed with exit code ' + $LASTEXITCODE) }
