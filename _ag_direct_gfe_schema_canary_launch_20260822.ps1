$ErrorActionPreference = 'Stop'
$wrapper = 'C:\GoogleDrive\AI\tools\ai-bridge\work\ask_antigravity_auto.ps1'
$promptFile = 'C:\Users\hsrsk\Documents\小説\_ag_direct_gfe_schema_canary_prompt_20260822.md'
$resultFile = 'C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\ag_direct_gfe_schema_canary_20260822.md'
$jobRoot = 'C:\Users\hsrsk\AppData\Local\Codex\ai-bridge\ag-jobs'
& $wrapper -PromptFile $promptFile -Out $resultFile -Timeout 'unbounded' -DirectResultFile -RequestId 'ag-direct-gfe-schema-canary-20260822' -JobId 'ag-direct-gfe-schema-canary-20260822' -JobRoot $jobRoot
$exitCode = $LASTEXITCODE
if ($exitCode -ne 0) { exit $exitCode }
