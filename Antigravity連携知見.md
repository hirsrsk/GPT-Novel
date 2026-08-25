# Antigravity連携知見

更新日: 2026-08-22
状態: AG専用カスタムエージェント「比屋定真帆」によるラッパー改良・同一会話レビューを完了。第3ラウンドで新規修正意見0件となり収束した。

## 運用方針

- Antigravity連携は専用カスタムエージェント「比屋定真帆」が担当する。
- 小説正本の編集と最終的な読戻しはティアが担当する。
- レビューループに既定回数・最大回数を置かず、任意・微修正を含む修正意見が0件になった時だけ停止する。
- 別モデル、別プロバイダー、API課金経路へ自動的に切り替えない。
- タイムアウトや結果不明時は同じjobをreconcileし、再送しない。

## 公式資料から確認した事実

### CLIと会話履歴

- Antigravity CLIはAntigravity 2.0と同じagent harnessを利用し、multi-step reasoning、tool calling、conversation historyを端末から利用できる。
- CLIとAntigravity 2.0はagent core・settingsを共有し、conversation exportにも対応する。
- 会話履歴はcurrent working directoryにscopeされる。再開時はconversation IDだけでなく同じworkspace/cwdを保証する必要がある。
- headless modeは初期状態ではstateless。直近会話は `--continue`、指定会話は `--conversation <ID>` で再開できる。
- `--continue` はworkspace内の直近会話を指すため、自動化では曖昧さのない `--conversation <UUID>` を標準とする。
- `--output-format json` は `conversation_id`、`status`、`response`、`duration_seconds`、`num_turns`、`usage` を返す。`conversation_id` は後続再開用と公式に定義されている。
- `--output-format stream-json` はinit、step_update、resultをNDJSONで返し、initにcwd・tools・permission_mode、tool stepにtool_name・parameters・outputを含められる。
- `--input-format stream-json --output-format stream-json` は一つのprocess内で複数turnを維持し、同じconversation_idと累積num_turnsを使う。durable jobごとにprocessを分ける現行方式では、まずJSON envelopeと明示conversation ID再開が最小変更になる。

### ブラウザとウェブ調査

- Antigravity製品はローカルChromeをopen/read/actuateでき、ドキュメントの読取やブラウザタスクを実行できる。
- Browser Subagentはタブ操作、スクリーンショット、操作動画を扱える。
- ただし製品機能の存在だけでは、現在のAGY CLI headless jobにbrowser toolが公開された証明にならない。
- CLI実証ではstream-jsonのinit.tools、step_update.tool_name、参照URL、検索結果を読戻し、実際のブラウザ／検索利用を証明する。

## 現行ローカルラッパーの確認済み境界

- `agy.exe --help` には `--continue` と `--conversation <ID>` が存在する。
- 正規wrapper `ask_antigravity_auto.ps1` は Prompt、PromptFile、Out、Timeout、DirectResultFile、IncludeGoogleDrive、AddDir、RequestId、JobId、JobRootだけを公開する。
- `antigravity_auto.py` は `agy --add-dir ... --print <prompt>` を組み立て、会話再開引数とJSON出力を転送していない。
- 改良前の正規wrapperで保証できるのは同一job identityの冪等観測・完了読戻しであり、同一conversationの継続ではない。

## ラッパー改良要件

1. 初回headless呼出しをJSON envelopeで受け、conversation_idとresponseを分離する。
2. responseは既存result contractへ渡し、conversation_idはsession manifestへ永続化する。
3. 後続呼出しは明示ConversationIdを受け、`--conversation <UUID>`へ転送する。
4. expected prior conversation ID、workspace/cwd、provider/job/request/prompt identityが一致しない場合はfail closed。
5. 初回と再開の要求・応答conversation ID一致を検証する。
6. num_turns増加と直前内容の再現で、ID一致だけでなく文脈継承を証明する。
7. 既存のresult/status/done/completion marker/reconcile契約、DirectResultFile、IncludeGoogleDrive、AddDirを維持する。
8. 非継続呼出しとの後方互換性を契約テストする。

## 公式実装から得た注意点

- 公式CHANGELOGでは、headless `--conversation/-c -p` が履歴全体を出力していた不具合が修正され、現在は新しいturnの応答だけを出す。
- 公式CLIはSQLiteをconversation形式として使用する。
- 公式issueではモデル切替後に会話contextを失う事例が報告されているため、レビュー中のmodel/provider切替を行わない。
- `--continue` のscopeに関する曖昧さが公式issueで指摘されているため、automationでは明示UUIDを使う。
- resume pickerが大きな履歴を読む際のRAM増大報告がある。自動処理ではpickerを使わず明示conversation IDを使う。

## 構造化結果の受入条件

- process exit codeだけでなくJSON envelopeの `status == SUCCESS` を必須とする。
- `conversation_id`、`response`、`num_turns`、`usage`を保存する。
- ERROR、CANCELED、INTERRUPTED、INVALID、WAITING、RUNNINGは成功扱いにしない。
- headlessではapproval-required toolがsoft-denyされてもrun全体がexit 0になり得る。stderr noticeとtool stepを確認し、目的のbrowser/read_urlが拒否された場合は検索実行済みとしない。
- providerの `--print-timeout` とwrapper/observerのdeadlineを分け、observer timeoutだけでprovider失敗や再送を決めない。

## 権限・認証・課金

- ウェブ権限は `read_url(domain)`、操作権限は `execute_url(domain)`。既定はAsk。
- headlessレビューでは必要な一次資料domainだけをallowし、`read_url(*)`、`execute_url(*)`、`--dangerously-skip-permissions`を避ける。
- Deny > Ask > Allowの優先順位がある。既存Ask/Denyが検索をsoft-denyしていないか確認する。
- `useG1Credits=true` は標準quota枯渇時にpersonal creditsへfallbackする。今回の経路ではfalseを要求し、読戻す。
- `modelProvider=gemini` と `GEMINI_API_KEY` はGemini API key経路になるため使用しない。
- `GOOGLE_GEMINI_BASE_URL`によるcustom endpointも使用しない。
- Windows Credential Managerの既存account sessionによるsilent keyring sign-inを正規経路とする。
- telemetry設定が有効な場合はinteraction dataが評価・改善へ使われ得る。連携知見としてlive値を記録する。

## Conversation・workspace・projectの結合

- `--continue` はabsolute workspace pathをキーとする `last_conversations.json`を使う。
- cache entryが欠落・削除済みの場合、`--continue`はfresh sessionを始め得るため、automationでは使用しない。
- 明示conversation再開では、その会話に関連づくAntigravity projectが自動的に選ばれる。
- manifestにはrequested/returned conversation ID、cwd/workspace roots、可能ならproject ID、num_turnsを保存する。
- statusline/hook payloadでは `session_id` は `conversation_id`の後方互換alias。headless JSONのconversation_idを第一権威とする。
- hook payloadはconversationId、workspacePaths、transcriptPathを持つが、hook追加は今回の最小ラッパー改良には不要。

## ウェブ調査の実証条件

- 製品機能としてのbrowser対応と、個別headless jobでの検索成功を区別する。
- stream-jsonのinit.toolsでbrowser/read_url相当のtool露出を確認する。
- step_updateのtool_name、tool_info、参照URL、結果を保存する。
- subagentを使う場合はsubagent_infoのconversation_id、log_uri、workspace_urisと子側tool利用を照合する。
- Browser allowlistは初期状態でlocalhostのみ。必要domainを限定許可する。
- server-side denylistが優先し、denylist service unavailable時はfail closedになる。
- AGブラウザは通常の個人Chromeとは別profileを使い、サインイン状態を共有しない。

## AGYバージョン境界

- JSON／stream-json、conversation_id出力、headless再開の修正は新しいCLIで提供された機能である。
- 現行binaryの `agy --version`、`agy --help`、実JSON envelopeを必ず確認し、公式最新Docsだけから機能を推定しない。
- 公式CHANGELOGでは、少なくとも次を確認した:
  - `--conversation/-c -p`が履歴全体でなく新しいturnだけを返す修正。
  - print modeのserver-side失敗がexit 0・空出力になる不具合の修正。
  - headless runがsettings.jsonのpermissions、file access、sandbox、artifact reviewを尊重する修正。
  - browser-related prompt sections欠落の修正。
- これらの修正が含まれない旧版なら、ラッパーだけで成功契約を保証できない。binary更新は別変更として扱い、勝手に行わない。

## ウェブ調査ループの収束

- 公式Docs、Google公式GitHub、GoogleCloudPlatform公式資料を対象に、会話継続、headless出力、ブラウザ、権限、課金、認証、MCP、subagent、project、hooks、会話保管、既知不具合の順で検索した。
- 新規カテゴリは、明示conversation ID、JSON/stream-json、workspace scope、soft-deny、G1 credit fallback、API key経路、read_url/execute_url、project自動結合、hook/session alias、browser allowlist、version境界まで増えた。
- 最終横断検索では上記カテゴリの再掲だけとなり、新しい連携契約・機能カテゴリが得られなかった。
- 2026-08-22時点で、こちら側のAG連携ウェブ調査は収束と判定する。今後は真帆によるlive実装・スモーク結果を優先し、公式Docs更新時だけ再調査する。

## 一次資料

- Google Antigravity Docs: CLI Overview
  - https://antigravity.google/docs/cli/overview
- Google Antigravity Docs: Managing Conversations
  - https://antigravity.google/docs/cli/conversations/
- Google Antigravity Docs: Headless Mode
  - https://antigravity.google/docs/cli/headless/
- Google Antigravity Docs: Browser Overview
  - https://antigravity.google/docs/ide/browser/
- Google Developers Blog: Build with Google Antigravity
  - https://developers.googleblog.com/en/build-with-google-antigravity-our-new-agentic-development-platform/
- Google公式Antigravity CLI repository
  - https://github.com/google-antigravity/antigravity-cli
- Google公式CHANGELOG
  - https://github.com/google-antigravity/antigravity-cli/blob/main/CHANGELOG.md
- GoogleCloudPlatform evalbench AGY testing guide
  - https://github.com/GoogleCloudPlatform/evalbench/blob/main/docs/agy_cli_agent_testing.md
- Google Antigravity Docs: Resume Command
  - https://antigravity.google/docs/cli/commands/resume/
- Google Antigravity Docs: Permissions
  - https://antigravity.google/docs/cli/permissions
- Google Antigravity Docs: AI Credits
  - https://antigravity.google/docs/cli/credits
- Google Antigravity Docs: Settings
  - https://antigravity.google/docs/cli/settings/
- Google Antigravity Docs: Best Practices
  - https://antigravity.google/docs/cli/best-practices/
- Google Antigravity Docs: Projects
  - https://antigravity.google/docs/cli/projects/
- Google Antigravity Docs: Plugins & Skills
  - https://antigravity.google/docs/cli/plugins/
- Google Antigravity Docs: Installation & Auth
  - https://antigravity.google/docs/cli/install/
- Google Antigravity Docs: Hooks
  - https://antigravity.google/docs/ide/hooks/
- Google公式Antigravity SDK Python
  - https://github.com/google-antigravity/antigravity-sdk-python

## ラッパー改良のライブ実証

- AG専用カスタムエージェント「比屋定真帆」が正規wrapperを改良し、ティアが実ファイルと成果物を読戻した。
- AGY CLI version: 1.1.18。
- `ask_antigravity_auto.ps1`
  - SHA-256: `73e4c00cb44f277ac88d593e40e984907dc7e972b8a1ffb560c41232d42efac0`
  - `-ContinueConversation`と`-ConversationId`を追加し排他検証する。
- `antigravity_auto.py`
  - SHA-256: `0dd618b3461f674d0b90e37984a3135c78ad2652be5e0cbf0424bfa932ff8752`
  - JSON envelopeを解析し、status、response、conversation ID、num_turns、usage、SQLite DB、workspace SHAを検証する。
- `ag_job_runner.py`
  - SHA-256: `03694622df744428c8c3dff050e37eac0fdb997f41be439add9685cd61d530ef`
  - conversation mode/requested ID/workspace SHA/session SHAをjob/status/doneへ保持し、identity conflictをfail closedする。
- session sidecar schema: `antigravity-conversation-session/1`。
- 新規会話 `86bb2ccc-7e2d-439c-bba7-43ead6b86d1d`:
  - Turn1はSUCCESS、num_turns=1。
  - 明示ID再開のTurn2も同じID、SUCCESS、num_turns=2。
  - Turn1だけに与えた `ORBIT-SAFFRON-7319`をTurn2が完全再現し、内容継承を確認。
- 新規契約テスト5/5、既存recovery 6/6、incident 10/10、background contract、py_compileがPASS。
- wrapperはmodel/billing/auth/API key/custom endpoint引数を渡さない。
- GEMINI_API_KEY、GOOGLE_API_KEY、ANTHROPIC_API_KEY、OPENAI_API_KEYはいずれもprocess environmentで未設定。
- active settingsにuseG1Credits、modelProvider、custom endpoint、API key関連keyは存在しない。absenceからprovider default値は推測しない。
- CLI logでsubscription callbackを確認した。

## DirectResultFileとresume sticky errorの根本修正

### 原因1: AG側の旧汎用write schema

- 旧AG指示はTargetFile、Overwrite、Description、toolAction、toolSummaryを使い、GFE 0.7.7の正規引数path、content、encoding、request_idと一致しなかった。
- DirectResultFile指示を正規GFE schemaへ修正し、新規canaryでgfe.execute_createのexact 4引数、ok:true、phase=Completed、AGY raw SUCCESSを確認した。

### 原因2: AGY 1.1.18のresume sticky error

- 同じconversationを再開すると、前turnのERROR fingerprintを後続成功turnのJSON envelopeへ再掲する場合がある。
- raw ERRORは隠さずsession sidecarへ保持する。
- 事前stateのerror SHA完全一致、新規step全完了、exact tool/request一致、GFE ok:true/Completed、result marker、requested/returned conversation ID、workspace SHA、result hashを全て満たす時だけturn-scoped effective SUCCESSとする。
- 条件の一つでも欠ければconversation contract failureとしてfail closedする。
- 元レビューconversationのturn 4でraw ERROR、sticky=trueを保持したままeffective SUCCESS、done completed、same ID、num_turns=4を確認した。
- R2本体turnのraw ERRORは履歴上そのまま残し、成功へ書き換えない。

### 最終実装・検証

- provider SHA-256: `0dd618b3461f674d0b90e37984a3135c78ad2652be5e0cbf0424bfa932ff8752`
- runner SHA-256: `03694622df744428c8c3dff050e37eac0fdb997f41be439add9685cd61d530ef`
- session contract test SHA-256: `341d4da430650f32c03619cbd669521d4414d1ea66a8e2b26b07c8ecd036a5e6`
- 新規・更新契約テスト6/6、既存recovery 6/6、incident 10/10、background、py_compileがPASS。

## AGウェブ検索のライブ証拠

- 初回レビューconversation ID: `f8d537d3-9b88-4024-9ff1-dd4c8e074104`。
- AGは `search_web`を14クエリ実行し、48 URLを結果へ採用した。
- conversation SQLiteの読取専用精査で、search_web 122 occurrences、nonfinal step 101、read_url 15、execute_url 4、browser 6を確認。
- soft_deny、permission_denied、tool_deniedはいずれも0。
- 公式hostとしてevangelion.jp、aniplex.co.jp、gonzo.co.jp、king-cr.jp、fullmeta-iv.com、patlabor.tokyo、fullmetal-panic.jp、lineup.toei-anim.co.jp等を確認。
- sanitized tool evidence:
  - `C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\novel_crossover_review_ag_round1_tool_evidence_20260822.json`
  - SHA-256: `54eed3768b58696fb5bcf8ff6bc435ecb496c61205588d97337a454196308ae4`

## AGレビュー第1ラウンド

- 結果: `CORRECTION_OPINIONS_FOUND`
- 修正意見: 13件（P2=9、P3=4）。
- 結果ファイル:
  - `C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\novel_crossover_review_ag_round1_20260822.md`
  - SHA-256: `2efc40a3234873b89f9ada28b87594c84b9152b66e2cba5db260a1fabeb2daa1`
- 正本21件はAGレビュー前後SHA一致・AG側変更0件。
- 指摘はティアが正本へ反映し、同じconversation IDで次ラウンドへ継続する。

## AGレビュー第2ラウンド

- 同一conversation `f8d537d3-9b88-4024-9ff1-dd4c8e074104`でR1の13件を会話履歴から再現し、全件CLOSEDを確認。
- 新規修正意見9件（P2=5、P3=4）を取得。
- R2本体turnはDirectResultFileの旧schema拒否によりraw ERRORであり、成功扱いしていない。
- 助言本文、result marker、同一会話内容、ウェブ検索結果は回収・保全した。
- Direct schemaとsticky errorの根本修正後、後続turnでR2-01からR2-09の履歴保持を確認した。
- R2の9件はティアが正本へ反映し、旧未確定表現の横断検索0件を読戻した。

## AGレビュー第3ラウンドと収束

- 同一conversation `f8d537d3-9b88-4024-9ff1-dd4c8e074104` を継続し、`cli_num_turns=5` を確認した。
- R2の修正意見9件はすべてCLOSED。
- R3の新規修正意見は0件、最終判定は `NO_CORRECTION_OPINIONS`。
- R1の13件とR2の9件、計22件を正本へ反映し、修正意見が出なくなる停止条件を満たした。
- R3は `search_web` 4回を実行し、tool stepsと参照結果を保存した。
- AGY 1.1.18が既知の前turn ERRORを再掲したためraw statusはERRORのまま保持した。事前error SHA一致、新規step全完了、正規GFE request、`ok:true / phase=Completed`、result marker、conversation ID、workspace SHA、result hashの全条件を満たしたため、そのturnだけeffective SUCCESSと判定した。
- R3前後で正本21件のSHAは全件一致し、AG側からの直接変更は0件。
- 結果ファイル:
  - `C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\novel_crossover_review_ag_round3_20260822.md`
  - SHA-256: `0bf179cbe99c63a9969591e2211a3bf58e4c3aa8b03ca951d22fbf3c5747660f`
- status SHA-256: `82f9b49023f9fe49e6d732d04993153e453781525a420eb8285204afe9051886`
- session SHA-256: `85d81ca9b08caba09f66d4de21914e0344a568ebc4fd70d2666794b93a5eae5b`
- done SHA-256: `6c29baca5bec065263d37985e6c31835360d32b8365c571a03b1c11bab98e62c`
- DB SHA-256: `7da7927c5b1678bb7cb44653bc019af59a0de64c9ba978557850c04a9decb1d3`
- sanitized tool evidence:
  - `C:\GoogleDrive\AI\tools\ai-bridge\work\antigravity_results\novel_crossover_review_ag_round3_tool_evidence_20260822.json`
  - SHA-256: `e9817b8696d254011bb4d2a2446a927a76d2fab01e26293803f32fc2d4855e26`

## 現在の未確認事項

- 今回のAGレビューとラッパー継続会話契約について未確認事項はない。
- 正本を再変更した場合は、同じconversationを再開して差分レビューを続ける。
