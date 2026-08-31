$ErrorActionPreference = 'Stop'
$wrapper = 'C:\GoogleDrive\AI\tools\ai-bridge\work\ask_antigravity_auto.ps1'
$promptFile = 'C:\Users\hsrsk\Documents\小説\_ag_session_canary_turn1_prompt_20260822.md'
$resultFile = 'C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\ag_session_canary_turn1_20260822.md'
$jobRoot = 'C:\Users\hsrsk\AppData\Local\Codex\ai-bridge\ag-jobs'
& $wrapper -PromptFile $promptFile -Out $resultFile -Timeout 'unbounded' -DirectResultFile -RequestId 'ag-session-canary-turn1-20260822' -JobId 'ag-session-canary-turn1-20260822' -JobRoot $jobRoot
$exitCode = $LASTEXITCODE
if ($exitCode -ne 0) { exit $exitCode }
