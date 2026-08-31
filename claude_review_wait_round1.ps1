$ErrorActionPreference = 'Stop'
$BridgeRoot = 'C:\GoogleDrive\AI\tools\ai-bridge'
$ManifestFile = Join-Path $BridgeRoot 'work\claude_results\novel_crossover_review_round1_manifest.json'
& (Join-Path $BridgeRoot 'work\wait_ai_result.ps1') -Manifest $ManifestFile -Provider 'claude' -Timeout '45s'
exit $LASTEXITCODE
