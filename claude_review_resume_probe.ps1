$ErrorActionPreference = 'Stop'
$Claude = 'C:\Users\hsrsk\AppData\Local\Microsoft\WinGet\Packages\Anthropic.ClaudeCode_Microsoft.Winget.Source_8wekyb3d8bbwe\claude.exe'
$PromptFile = 'C:\GoogleDrive\AI\tools\ai-bridge\work\claude_results\novel_crossover_resume_probe_prompt.md'
$Workspace = 'C:\Users\hsrsk\Documents\小説'
if (-not (Test-Path -LiteralPath $Claude -PathType Leaf)) { throw 'Claude CLI was not found.' }
$forbiddenBillingVariables = @('ANTHROPIC_API_KEY','ANTHROPIC_AUTH_TOKEN','ANTHROPIC_BEARER_TOKEN','ANTHROPIC_BASE_URL','AWS_BEARER_TOKEN_BEDROCK','CLAUDE_CODE_OAUTH_TOKEN','CLAUDE_CODE_USE_BEDROCK','CLAUDE_CODE_USE_VERTEX','CLAUDE_CODE_USE_FOUNDRY')
foreach ($name in $forbiddenBillingVariables) { if (-not [string]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable($name))) { throw ('subscription_only_guard_failed:' + $name) } }
$prompt = [IO.File]::ReadAllText($PromptFile, [Text.UTF8Encoding]::new($false))
$output = $prompt | & $Claude '-p' '--resume' '2263fc49-33d8-4993-a80a-57f7f0ab5073' '--output-format' 'json' '--permission-mode' 'bypassPermissions' '--disallowedTools' 'Edit,Write,NotebookEdit' '--model' 'opus' '--add-dir' $Workspace 2>&1
$providerExitCode = $LASTEXITCODE
$output | ForEach-Object { [Console]::Out.WriteLine([string]$_) }
exit $providerExitCode
