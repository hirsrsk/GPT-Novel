$ErrorActionPreference = 'Stop'
$wrapper = 'C:\GoogleDrive\AI\tools\ai-bridge\work\ask_antigravity_auto.ps1'
$promptFile = 'C:\Users\hsrsk\Documents\小説\_ag_r2_advice_continuity_prompt_20260822.md'
$resultFile = 'C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\ag_r2_advice_continuity_check_20260822.md'
$jobRoot = 'C:\Users\hsrsk\AppData\Local\Codex\ai-bridge\ag-jobs'
& $wrapper -PromptFile $promptFile -Out $resultFile -Timeout 'unbounded' -DirectResultFile -ConversationId 'f8d537d3-9b88-4024-9ff1-dd4c8e074104' -RequestId 'ag-r2-advice-continuity-20260822' -JobId 'ag-r2-advice-continuity-20260822' -JobRoot $jobRoot
$exitCode = $LASTEXITCODE
if ($exitCode -ne 0) { exit $exitCode }
