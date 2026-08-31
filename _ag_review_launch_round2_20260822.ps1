$ErrorActionPreference = 'Stop'
$wrapper = 'C:\GoogleDrive\AI\tools\ai-bridge\work\ask_antigravity_auto.ps1'
$promptFile = 'C:\Users\hsrsk\Documents\小説\_ag_review_prompt_round2_20260822.md'
$resultFile = 'C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\novel_crossover_review_ag_round2_20260822.md'
$jobRoot = 'C:\Users\hsrsk\AppData\Local\Codex\ai-bridge\ag-jobs'
$sourceDir = 'C:\Users\hsrsk\Documents\小説'
& $wrapper -PromptFile $promptFile -Out $resultFile -Timeout 'unbounded' -DirectResultFile -AddDir $sourceDir -ConversationId 'f8d537d3-9b88-4024-9ff1-dd4c8e074104' -RequestId 'novel-crossover-ag-review-r2-20260822' -JobId 'novel-crossover-ag-review-r2-20260822' -JobRoot $jobRoot
$exitCode = $LASTEXITCODE
if ($exitCode -ne 0) { exit $exitCode }
