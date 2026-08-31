$ErrorActionPreference = 'Stop'
$wrapper = 'C:\GoogleDrive\AI\tools\ai-bridge\work\ask_antigravity_auto.ps1'
$promptFile = 'C:\Users\hsrsk\Documents\小説\_ag_review_prompt_round1_20260822.md'
$resultFile = 'C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\novel_crossover_review_ag_round1_20260822.md'
$jobRoot = 'C:\Users\hsrsk\AppData\Local\Codex\ai-bridge\ag-jobs'
$sourceDir = 'C:\Users\hsrsk\Documents\小説'
& $wrapper -PromptFile $promptFile -Out $resultFile -Timeout 'unbounded' -DirectResultFile -AddDir $sourceDir -RequestId 'novel-crossover-ag-review-r1-20260822' -JobId 'novel-crossover-ag-review-r1-20260822' -JobRoot $jobRoot
$exitCode = $LASTEXITCODE
if ($exitCode -ne 0) { exit $exitCode }
