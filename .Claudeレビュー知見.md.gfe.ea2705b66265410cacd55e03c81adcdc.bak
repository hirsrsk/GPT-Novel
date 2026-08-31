# Claudeレビュー知見

更新日: 2026-08-26

## 2026-08-26本文掲載順111章・クロエ同一セッションレビュー

- 詳細正本: [本文掲載順詳細章立て.md](本文掲載順詳細章立て.md)
- 大局正本: [長編大枠再構築.md](長編大枠再構築.md)
- Claude連携担当: 専用カスタムエージェント「臥煙遠江」
- 呼称: クロエ（PC1 Claude）
- Claudeモデル: Opus、解決モデル `claude-opus-4-8`
- 認証・課金経路: claude.ai、`subscription_only`
- 永続session_id: `449ae1b0-30d3-4b4e-8464-421fbe3f2470`
- 4巡すべて要求・応答session ID一致。新規session、fork、別provider、別modelは未使用。

### 詳細レビュー巡

| 巡 | 前巡指摘の閉鎖 | 新規意見 | 詳細正本の状態 |
|---|---:|---:|---|
| R1 | 新規116章をゼロベース監査 | P1=3、P2=7、P3=11、計21 | 116章案 |
| R2 | R1の21件すべてCLOSED | P2=2、P3=2、計4 | 111章へ圧縮 |
| R3 | R2の4件すべてCLOSED | P3=2 | 番号・フック・主視点を整合 |
| R4 | R3の2件すべてCLOSED | P0〜P3=0 | 111章、全27件CLOSED |

### R4収束証拠

- レビュー対象章構造SHA-256: `805456ac3f2e6ca4c270ba8a3a005d134db65506993b7d68aed7ac090521f54c`
- job: `claude-a64a4fe0cfe81809937a635a`
- request: `claude-20260826_133839-21700-88ed5bd9`
- prompt SHA-256: `91c9d6d90cfe0acdcd773e8d0dc625c9aeaa266d59ba9a4223ec58278441039f`
- manifest SHA-256: `16aae930bf64a6470b889af0b78788e1293c551d395bb767b03aff34b2aaf9a5`
- done SHA-256: `6f87d91837d401da565e447429f41b9fca64455767b4b54cb60775a507ee02d6`
- status SHA-256: `bad2c9a8fa3641f717182f3993bc1c2dab6f6d1ec5d2275e39ddae91200b28ae`
- result SHA-256: `e7665ff75e9a522dfb95be6789f693970f0268215692d73a0c35f4c92b8a5114`
- result: `C:\GoogleDrive\AI\tools\ai-bridge\work\claude_results\novel_detailed_chapter_review_r4_20260826.md`
- `done.state=completed`、`review_completed=true`、completion marker、result SHA一致。
- `same_session_verified=true`、`runner_session_identity_verified=true`。
- R1〜R3の全27件CLOSED。R4新規修正意見0件。
- 判定: `NO_CORRECTION_OPINIONS`。

収束後、詳細正本へ証拠節だけを追記したため、現行ファイルSHAはレビュー対象章構造SHAと異なる。111章の表本文は変更していない。

## 2026-08-24設定改訂による旧レビュー知見の扱い

- このファイルの各ラウンドは、その時点の草稿へ対するレビュー証跡として保持する。
- ラウンド1以降に記された「さくら魂・オモイカネ・ルリ／アキトが2000年／2005年の同じ裂け目へ由来する」「オモイカネが2000年からジオフロントへ落着して十五年間休眠する」という整理は、当時の草稿内では収束していたが、現在設定としては撤回済み。
- 現在の正本では、ルリ、アキト、シノブ側の因果は2005年の裂け目を使う一方、オモイカネの人格連続性コアは別のボソンジャンプ事故で神話成立以前へ到着し、黒き月の生体・位相制御層へ組み込まれる。
- ゲヒルンはセカンドインパクト後に演算核を発見し、未来製AIではなく黒き月固有の古代アーティファクトと誤認する。MAGIは赤木ナオコの独立設計として残る。
- 2015年のルリとの再会後、オモイカネは第三新東京市フルオペレートとブラックサレナ修復を支える。
- IFSは民生低密度、産業・警察中密度、全身・多系統高密度へ分化し、車やPCへの低密度普及を正式採用した。
- 現在設定の権威資料は [作品調査_機動戦艦ナデシコ.md](作品調査_機動戦艦ナデシコ.md)、[作品調査_新世紀エヴァンゲリオン.md](作品調査_新世紀エヴァンゲリオン.md)、[2015年人型兵器性能再設計.md](2015年人型兵器性能再設計.md)、[作品横断時系列.md](作品横断時系列.md)、[長編大枠再構築.md](長編大枠再構築.md) とする。
- 次回Claude／Antigravityレビューはこの改訂後の正本を新しい入力として行い、旧草稿の収束判定を現在設定の制約として扱わない。

## 2026-08-24非時系列再構成後・クロエ同一セッションレビュー

### 実行条件

- Claude連携担当: 専用カスタムエージェント「臥煙遠江」
- 呼称: クロエ（PC1 Claude）
- Claudeモデル: Opus、解決モデル `claude-opus-4-8`
- 認証: claude.ai Pro、`subscription_only`
- 永続Claude session_id: `449ae1b0-30d3-4b4e-8464-421fbe3f2470`
- 全8巡で要求session IDと応答session IDが完全一致し、新規session・fork・別provider・別modelを使用していない。
- 停止条件は既定回数でなく、任意提案・微修正を含む新規修正意見0件と `NO_CORRECTION_OPINIONS` の明示。

### 正規wrapperの同一セッション対応

開始時、正規wrapperには既存sessionを再開する公開引数がなく、`claude_auto.py`も `--no-session-persistence` を無条件付与していた。このため新規sessionへ切り替えずレビューを停止し、canonical route自体を修正した。

- `ask_claude_auto.ps1`: `e90929dca3c0b692bbd9a5d7442f8264800dfa441607df78c82b6e34ce72e33b`
- `claude_job_launcher.py`: `2fb83db32a4bd9875aa71dbb3d1ec70055b1bb4942b7900c6668cc8f05b53977`
- `claude_auto.py`: `229300f7ad30d7d6f1a909d70357858e73d56785741405091b297ea031b08213`
- `ai_job_runner.py`: `c9c53f3d39167a006262607873b2dd8791bab498b44175a020e8338b6864379c`
- 専用契約テスト: `fc181e638c415869a50404ade0ec458afa7d10eeda5ddb92a0a8e530b8a4e81b`

wrapper→launcher→provider runner→common runnerの全段へ明示session IDを保持し、resume時だけ `--resume <exact-id>` を使い、要求・応答・status・runner identityの完全一致を成功条件とした。通常新規jobは従来どおり `--no-session-persistence` を使う。専用6件と既存language／transport／background-process回帰を通過。

初回canaryはClaude OAuth期限切れのHTTP 401で入力・費用0のまま停止した。ユーザー再認証後、同じsession IDを新しい相関jobで再開し、レビューを開始した。

### レビュー巡

| 巡 | 前巡指摘 | 新規意見 | 結果SHA-256 |
|---|---|---:|---|
| R1 | 新サイクル開始 | P1=1、P2=1、P3=3、計5 | `201ff16ce361f00b4d450bd18058208e9103f04610063381c1adaf0cdc990948` |
| R2 | R1五件CLOSED | P2=1、P3=3、計4 | `48a9fac2195f4fbd3da284cb0c260ee5b4ad07578c58079be627b18d7bf2c227` |
| R3 | R2四件CLOSED | P3=3 | `9530d49142d089180ef0d793ebe677677af032a26b7176233fdc9468668be2d8` |
| R4 | R3三件CLOSED | P3=2 | `9104a91348f4957d8e1cbd2b7cdb8452b420bc568965dc1d8b4ba0861ac872ba` |
| R5 | R4二件CLOSED | P2=1 | `23586f790c3ed85920cc63b193318d744586d208fb8335228715148e90343012` |
| R6 | R5一件CLOSED | P2=1 | `b8c79323f0997c731e1c21a3cc4e7258aa857a2cff62c8c4bc60746d81617fe0` |
| R7 | R6一件CLOSED | P3=1 | `6a4766425989ea36a8fcd6091a81688eb264e6b3595e6e53d3261884e09a5d42` |
| R8 | R7一件CLOSED、R1〜R7全件CLOSED | P0〜P3=0 | `a8b1da9543acb3e8a6c5101e60d1d028e52db21eae72c181dd7f23f020d02c0d` |

### 主な反映内容

- オモイカネ旧2000年落着残存を除去し、太古の黒き月への別ボソンジャンプへ統一。
- 霧香を14〜15歳・2年A組、ミレイユを若い成人講師へ統一。
- 反応表の初対面部・相談継続部、採用表脱落、範囲の起点・終点を全件突合。
- 正守・夜行の成人確定と、良守・時音の未確定配置を分離。
- 本文提示順へオモイカネ太古前史の断片・真相開示位置を追加。
- 篠原重工提携・百目鬼ウィスパードの正式採用と、ミスリル関係の分岐を分離。
- ARX-8レーバテインを第14部までのロールアウト確定へ統一。
- アキト・ミサト初会談を第3部、関係変化を第12部へ配置。
- 第6部の小狼対面と第10部のレイス露見を、アクション後の静かな独立ビートへ分離。
- 百目鬼ウィスパード設定を全横断資料で確定叙述へ統一。
- アスカの平時異能反応をD、弐号機同調・A.T.フィールド発生時のみB〜Aへ確定。

### R8収束証拠

- job: `claude-9d84eefcbe7c283a52166dc3`
- request: `claude-20260824_140356-33832-72307e76`
- session要求＝応答: `449ae1b0-30d3-4b4e-8464-421fbe3f2470`
- manifest SHA: `bd81597b8769298a17eafa501859407e47d1c1e95946799c5bc953abb628fe37`
- done SHA: `c9577a948eb9aa0f23a5b80acd353eb76f0c2040c51df9cf0cba322a4419bbb0`
- status SHA: `67276b52608b333c70064f842be20f394677476fdd3e44a7781b598cba7267ae`
- result SHA: `a8b1da9543acb3e8a6c5101e60d1d028e52db21eae72c181dd7f23f020d02c0d`
- `done=completed`、`review_completed=true`、completion marker、result digest、session二重検証を確認。
- 9正本はR8前後SHA不変、task-owned runner PID不存在、残存job process 0、lock／errorなし。
- 判定: `NO_CORRECTION_OPINIONS`

結果ファイル:
- [R1](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r1-20260824-0321/result.md)
- [R2](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r2-20260824-0340/result.md)
- [R3](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r3-20260824-0356/result.md)
- [R4](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r4-20260824-0411/result.md)
- [R5](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r5-20260824-0430.result.md)
- [R6](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r6-20260824-0442.result.md)
- [R7](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r7-20260824-0452.result.md)
- [R8・収束](C:/Users/hsrsk/AppData/Local/Codex/ai-bridge/requests/claude-novel-presentation-review-r8-20260824-0503.result.md)

## ラウンド1

- Claudeモデル: Opus
- 対象: クロスオーバー関連Markdown 20ファイル
- 対象外: カクヨム向け現代ファンタジー設定メモ.md
- Claude session_id: 2263fc49-33d8-4993-a80a-57f7f0ab5073
- 結果SHA-256: 2fb026c59660bb66898e89f1df74f8ab5b21726485d43ea535e24ba4ca2dbab2
- 判定: P0=2、P1=4、P2=5、P3=4、再レビュー必須

### 採用した主要指摘

- さくらの身体の保護場所・管理者・2015年の身体年齢を確定。
- セカンドインパクトの時空裂け目を、さくら魂・オモイカネ・ルリ／アキト漂着の共通原因へ変更。
- 一度目の2015年を、技術流入が起きなかった別の破滅世界線と定義。
- オモイカネを未発見ではなく、ゲヒルン／MAGIが検知済みだが解読不能でゲンドウが秘匿した異常核へ変更。
- 主題の反復を、ゲンドウ=呼称、ルリ=過保護、アキト=自滅、小狼=所有、昴流=自己抹消へ差別化。
- 第7部を皇一族・川平家の再会と、犬神・なでしこの戦場へ分割。
- ゲートキーパーズ正規側を第9部から全面登場へ変更。
- ゼーレは意味・儀式、アマルガムは規格・量産を求める手口へ差別化。
- 第14部を諜報→機体→魔術・魂分離の三幕リレーへ変更。
- レイ、アスカ、トウジ、カヲル、アキト／ミサトの関係へ中間段階を追加。
- ジュリエッタの死を2000年セカンドインパクト直後の避難混乱期へ統一。
- 桃矢を2015年に34〜35歳前後へ修正。
- 高倉が名乗ってからヒカリが「高倉さん」と呼ぶ会話へ修正。

### 採用しなかった指摘

- 百目鬼が17歳で開発主任という設定を原作乖離とする指摘。
  - 既存調査では17歳、12歳でケンブリッジ入学、開発主任という根拠があるため不採用。
- IFS全身発光の原作根拠不足。
  - 既にクロスオーバー独自設定として節分け済みのため変更不要。

## 同一Claudeセッションの問題

- ラウンド1はAI Bridgeの claude_auto.py が --no-session-persistence を付けて開始した。
- 結果には session_id が返ったが、公式 --resume で No conversation found となり再開不能だった。
- ラウンド2を別セッションで代用していない。
- 次回から、レビュー開始前にセッション保存が有効な経路を選び、最初のsession_idへ全レビューラウンドを継続する。

## 専用カスタムエージェントによる永続レビュー

- Claude連携担当: 専用カスタムエージェント「臥煙遠江」
- Claudeモデル: Opus（解決モデル claude-opus-4-8）
- 対象: クロスオーバー関連Markdown 21ファイル
- 対象外: カクヨム向け現代ファンタジー設定メモ.md
- 永続Claude session_id: 449ae1b0-30d3-4b4e-8464-421fbe3f2470
- 初回結果SHA-256: a8810d173427199e43684e429f4384b897dd9d31e7a36d124695d0a90766d772
- 同一セッション継続結果SHA-256: b0841c3746993e3e17452f9c2030efcfefd92f32a3672129d5d8ba69ba4f184f
- 判定: PASS、P0=0、P1=0、P2=2、P3=4
- --resume で要求・応答session_idが一致し、直前レビューの判定と指摘名を再現できたため、同一セッション継続を確認済み。
- 正本21件はレビュー前後のSHA-256が一致し、Claude側の変更なし。

### 指摘と反映

- 一度目と本編世界線の分岐原因を、シンジの意識が2005年へ戻った瞬間の裂け目再励起として明示。
- 綾音・美羽を第7部B終盤へ先行登場させ、第9部で正式紹介する二段階へ変更。
- 桃矢の年齢を34〜35歳前後へ統一。
- オモイカネは休眠中も微弱な演算干渉と異常信号を残す確定設定へ変更。
- ジュリエッタの敵から根拠のない「使徒の力を与えられた兵士」を外し、ゼーレ系回収部隊／魔術工作員へ整理。
- 21世紀警備保障は既存会社であり、政府出資と特別事業部を受け入れて運用主体へ再編された、と全関連資料で統一。

### 継続規則

- 次ラウンド以降も「臥煙遠江」だけがClaudeと連携する。
- 新規セッションを作らず、必ず永続session_id 449ae1b0-30d3-4b4e-8464-421fbe3f2470を再開する。

## ラウンド2

- 同一session_idを再開し、前回六件を再確認。
- 結果SHA-256: d29c42566c34cf45056913fa8ad4eebc379ebc839a5056599ee53fe5e17d7e0c
- 判定: CONVERGED
- 前回六件: 全件CLOSED
- 件数: P0=0、P1=0、P2=0、P3=1
- 残ったP3は、2005年の裂け目再励起が2000年側出口へ遡及する因果の明文化。
- 作品横断時系列.mdと長編大枠再構築.mdへ、一度目の破滅世界線ではオモイカネ落着とさくら魂分離・裂け目流入が起きず、本編世界線で遡及的に成立する旨を追加。

## ラウンド3・最終確認

- 同じsession_idを再開し、ラウンド2のP3だけでなく全体の新規指摘も再点検。
- 結果SHA-256: fd24d8c2832328655ccae4f273e680412f084a755021ed8cd551239e21c6c285
- 判定: FINAL_CONVERGED
- 件数: P0=0、P1=0、P2=0、P3=0
- primary manifest: persistence_verified=true、same_session_resume_count=3
- 要求session_idと応答session_idは全ラウンドで一致。
- Claude側はRead／Glob／Grepのみを使用し、正本21件はレビュー前後のSHA-256一致、変更0件。
- ラウンド3の「再レビュー不要」は、P0〜P3が0件という狭い判定に基づくため撤回する。

## 収束条件の訂正

- レビューループに既定回数・最大回数を置かない。
- 矛盾や高優先度指摘だけでなく、任意提案・微修正・加筆・削除・表記統一も修正意見へ数える。
- Claudeの修正意見が1件でも出たラウンドは収束扱いにせず、正本へ反映して同じsession_idで次のレビューを行う。
- Claudeが修正意見0件を明示したときだけ停止する。
- Claude連携は引き続き専用カスタムエージェント「臥煙遠江」が担当する。

## ラウンド4

- 同じsession_idで、重要度分類に限定せず全21正本を編集者・構成設計者の観点から再点検。
- 結果SHA-256: 193926bb02663c83f3c0dc6af38ac0290765079c6c4e25e866e328ba9730c785
- 判定: CORRECTION_OPINIONS_FOUND
- 修正意見: 22件（推奨8件、任意14件）
- 章ごとの時期、カヲルの目的と予見範囲、諜報員の認識範囲、大道寺とさくらの既存の縁、昴流の主観、綾音・美羽の代名詞、ゲンドウの動機時点、配置表、作品名・技術用語・みおり役割名、学生学年、アキトの料理動機、トウジ妹の負傷、維持型結界、成人さくらの再会、レイ・シノブ・ユイ、ユイの長期意図、遡及文、大道寺グループの業種、改訂履歴を修正。
- 正本15件へ反映し、旧表現の横断検索0件と保存後SHA-256読戻しを確認。
- 次ラウンドも同じsession_idへ継続し、修正意見0件になるまで反復する。

## ラウンド5

- 同じsession_idでR4の全項目を実本文照合し、全22件と横断3系統がCLOSED。
- 結果SHA-256: b0d00717d542a74853277a154b764914d1150ba54df8cd268e7bab4f442fa70d
- 判定: CORRECTION_OPINIONS_FOUND
- 新規修正意見: 5件（すべて任意）
- ケルベロス・月とカヲルの解決済み未確定欄を整理。
- シノブとアキト節の番号構造を修正し、料理動機を下位補足へ移動。
- 第3部へトウジ妹負傷の発生を置き、第4部の怒りへ接続。
- 目的表へ宗介の警護・本人選択の人物弧を追加。
- 正本3件へ反映・読戻し済み。
- 次ラウンドも同じsession_idで修正意見0件になるまで続ける。

## ラウンド6

- 同じsession_idでR5の5件を実本文照合し、全件CLOSED。
- 結果SHA-256: 13b7668c27938a2108e849fc6c44993c8a6a60f9926e4d9e56010c549bc75598
- 判定: CORRECTION_OPINIONS_FOUND
- 新規修正意見: 3件（すべて任意）
- CCS未確定欄の最終分離時結界解除を一項へ統合。
- 目的表へみおりを追加し、宗介との主題上の対を明示。
- ルリ・オモイカネとゲンドウの個人行／ユニット・主体行を役割注記で区別。
- 正本2件へ反映・読戻し済み。
- 次ラウンドも同じsession_idで修正意見0件になるまで続ける。

## ラウンド7

- 同じsession_idでR6の3件を実本文照合し、全件CLOSED。
- 結果SHA-256: ba0698ef1ef36bf443c374200a17e3231cff7e8995675459c3d3845b18d7af42
- 判定: CORRECTION_OPINIONS_FOUND
- 新規修正意見: 3件（すべて任意）
- ダイ・ガード検索ログの誤名を赤木駿介へ訂正。
- 登場作品一覧の『フルメタル・パニック!』『いぬかみっ!』を半角感嘆符へ統一。
- 最終分離時の停止・医療維持解除手順は魔術整理を横断正本とし、CCS調査から参照する形へ一本化。
- 正本4件へ反映・読戻し済み。
- 次ラウンドも同じsession_idで修正意見0件になるまで続ける。

## ラウンド8・収束

- 同じsession_idでR7の3件を実本文照合し、全件CLOSED。
- 結果SHA-256: 7becec19b58df9ea5189e55c08ac053f142a1dccd324ce118cb09ff350ecf54d
- 判定: NO_CORRECTION_OPINIONS
- 新規修正意見: 0件
- 候補も実本文で検証し、既修正・意図的配置・確証不足として不採用理由を明示。
- primary manifest: persistence_verified=true、same_session_resume_count=8
- 要求session_idと応答session_idは一致。
- Claude側は読取専用で、正本21件はレビュー前後SHA-256一致、変更0件。
- ラウンド4以降に反映した修正は計33件。
- 既定回数ではなく「任意・微修正を含む修正意見0件」の条件を満たしたため、ここでレビューループを停止する。


