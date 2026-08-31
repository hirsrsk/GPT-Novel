$ErrorActionPreference = 'Stop'
$BridgeRoot = 'C:\GoogleDrive\AI\tools\ai-bridge'
$PromptFile = Join-Path $BridgeRoot 'work\claude_results\novel_crossover_review_round1_prompt.md'
$OutFile = Join-Path $BridgeRoot 'work\claude_results\novel_crossover_review_round1.md'
$ManifestFile = Join-Path $BridgeRoot 'work\claude_results\novel_crossover_review_round1_manifest.json'
$Workspace = 'C:\Users\hsrsk\Documents\小説'
if (-not (Test-Path -LiteralPath $BridgeRoot -PathType Container)) { throw 'AI bridge root was not found.' }
& (Join-Path $BridgeRoot 'work\ask_claude_auto.ps1') -PromptFile $PromptFile -Out $OutFile -Model 'opus' -Timeout '15m' -ResponseLanguage 'ja' -ResponseValidationMode 'natural_language' -AddDir $Workspace -RequestId 'novel-crossover-review-r1-20260822' -JobId 'novel-crossover-review-r1-20260822' -Manifest $ManifestFile -NoWait
