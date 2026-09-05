---
name: novel-prose-guard
description: Project-local prose workflow for Japanese novel drafting and revision. Use for dialogue, narration, vocabulary, speaker identification, natural realization of contract-approved forms of address, abstract AI phrasing, repetition, and sentence rhythm after structure and the applicable scene contract are fixed. Do not use it to redesign outlines, scene order, causality, character roles, information disclosure, continuity, or chapter-end connections.
---

# Novel Prose Guard

## Purpose

Use this skill only for this novel project. Own the `PROSE` layer: make the written scene sound project-native without changing what the scene is structurally required to do.

Before changing prose, read the project structure guide and the applicable scene contract. Treat the contract as fixed input during the prose pass. If wording exposes a causal, role, information, continuity, or transition contradiction, classify it as a structure problem instead of hiding it with smoother sentences.

## Three-Layer Triage

Classify every requested change before editing:

- `STRUCTURE`: outline or scene order, causality, character wants or roles, information disclosure, injury/possession/time continuity, structural spoilers, or chapter-end connection. Use `$novel-structure-guard`.
- `SCENE_CONTRACT`: the current scene or arc invariant, including viewpoint, time, place, participants, stream/mic/camera state, known and unknown information, permitted or required forms of address, relationship stage, emotional target, required beats, forbidden outcomes, start state, end state, and handoff. Establish or revise it through the structure workflow before prose work.
- `PROSE`: dialogue, narration, vocabulary, speaker identification, natural surface realization of the contract-approved forms of address, concrete versus abstract expression, repetition, or sentence rhythm. Handle it here without changing the first two layers.

For a mixed request, settle `STRUCTURE`, then `SCENE_CONTRACT`, then `PROSE`. A prose review may report a higher-layer defect, but must not silently rewrite the contract to make a preferred sentence fit.

## Required Reading Before Prose

Before drafting or editing prose, identify the target family. Read the common sources plus only the matching family route; do not mechanically load an unrelated project branch.

Common sources for every target:

1. `本文構造指針.md`.
2. The applicable `本文場面契約_<編名>.md`; for the current Israfael arc, use `本文場面契約_イスラフェル編.md`.
3. `本文文体指針.md`.
4. The target file and its actual previous and next scene or chapter when they exist.

### Repository-Root Crossover Targets

Use this route for crossover files stored at the repository root, such as `本文_仮04_*.md`, `本文_仮05_*.md`, and other root `本文_*.md` files.

Read the root planning and research sources relevant to the target:

- `長編大枠再構築.md` as the active overall structural source. Treat `長編全体再構築_事件駆動版.md` as discarded and non-authoritative; read it only when the user explicitly requests historical or discarded-plan comparison, and never use it to decide current structure.
- `本文掲載順詳細話数構成.md` to resolve reader order and actual adjacent scenes.
- `全111話人物知識・読者開示台帳.md` when knowledge or reveal state affects the passage.
- `全111話人物関係・内的劇配置表.md` when relationship or internal-drama placement affects the passage.
- Only the `作品調査_<作品名>.md` files for works and characters actually present in the target.
- Any other root setting or continuity source directly named by the structure guide, scene contract, target, or user.

Do not require `main_novel/*` files for this route unless the applicable root document or the user explicitly makes one relevant.

### `main_novel/` Targets

Use this route only when the target is under `main_novel/`:

1. `main_novel/gpt_handoff.md`
2. `main_novel/gpt_notes.md`
3. `main_novel/user_written_style_samples.md`
4. Relevant settings or memos:
   - `main_novel/settings.md`
   - `main_novel/settings_streamers.md`
   - `main_novel/memo_kotoha.md` for Kotoha recovery, food dependency, and consent or choice signals.
   - `main_novel/memo_stream_store.md` for streaming and unmanned produce stand handling.
   - `main_novel/memo_ch4_akane_yura_amagi.md` for Akane, Yura, Amagi, and final-arc material.
   - `main_novel/detail_amagi_mizuhara.md` for Mizuhara and Amagi Medical.
   - `main_novel/comments.md` for comment threads or bulletin-board sections.

If no applicable scene contract exists and the requested task already authorizes drafting or revision, use the structure workflow in the same task to derive and create the minimal contract from the available authoritative sources, then continue to prose. Do not add an approval, passcode, new-task requirement, or blanket refusal merely because the contract file was missing. Ask only when a material story choice remains genuinely unresolved.

If the user is only giving text to be received, do not rewrite it until instructed.

## Prose Workflow

Before writing:

1. Extract and lock the contract fields that affect the passage: viewpoint, time and place, present or absent characters, channel state, known and unknown facts, character wants and roles, permitted or required forms of address, relationship stage, emotional target, required beats, prohibited outcomes, and end-state handoff.
2. For a `main_novel/` target, choose the closest relevant entry from `main_novel/user_written_style_samples.md`. For a repository-root crossover target, use `本文文体指針.md`, the target and adjacent root prose, and any user-identified sample relevant to that continuity domain; do not load the `main_novel/` sample file by default. State internally whether the chosen evidence teaches viewpoint distance, sentence flow, dialogue pressure, speaker handling, or restraint; do not copy only its surface rhythm.
3. Identify the exact `PROSE` defect and the smallest surrounding exchange needed to repair it.
4. Draft or revise while preserving every locked contract field.
5. Re-read the whole exchange and the next response. Do not patch one line in isolation when its reply, speaker attribution, or emotional pressure depends on it.
6. Reclassify any remaining defect. Escalate `STRUCTURE` or `SCENE_CONTRACT` findings explicitly instead of forcing a lexical fix.

## Skill Growth

Treat this skill as project-specific prose memory, not a finished static rule.

- When the user identifies prose as their own writing, or says a passage is close to their style, preserve enough source text or file/line anchors in the authoritative style source for that target family. Use `main_novel/user_written_style_samples.md` only for `main_novel/` targets; for repository-root crossover work, update the relevant root prose or style source named by the user or project instead of silently routing it into `main_novel/`.
- When the user points out a recurring general prose failure, update this skill or `本文文体指針.md`.
- When a failure concerns causal order, information, role, continuity, or transition, update the structure guide, applicable scene contract, or `$novel-structure-guard` instead.
- When a failure is character-specific, update the applicable contract, character memo, or setting rather than generalizing it into a universal prose ban.

Use the user's judgment patterns—viewpoint discipline, information routing, motive, restraint, and dialogue pressure—to write original project-native prose. Do not mechanically imitate sample wording.

## Prose Rules

Prefer the user's prose logic over generic polish.

- Keep narration within the viewpoint and knowledge already locked by the scene contract. Use only perceptions, memories, guesses, and inferences available there; do not add a new reveal during a prose-only pass.
- Let action, timing, and dialogue carry meaning before adding explanation.
- In non-urgent conversation, do not stack bare dictionary-form endings such as `〇〇する`, `待つ`, or `私は止める` until dialogue sounds like an operations memo or bullet list. Make endings and turn transitions audibly request, answer, object, hesitate, or otherwise act on the listener, so each turn answers or pulls the next. Preserve meaningful brevity in emergency communications, medical reports, character-specific laconic speech, Rei's brief `行く`, and Asuka's deliberate assertions; do not uniformly make dialogue polite or longer.
- Keep each speaker identifiable through established voice, intention, action, and turn order. Add an attribution only when the reader would otherwise misidentify the speaker; do not turn dialogue into repeated name tags.
- Treat permitted or required names, pronouns, titles, kinship terms, forms of address, relationship stage, and emotional target as locked contract fields. Realize them naturally through placement, omission, inflection, and surrounding action, but do not replace relationship-specific address with a neutral or polite generic form or advance the relationship through wording alone.
- Let character voices differ through desire, relationship, pressure, and what they avoid saying. Do not reduce them to catchphrases or make everyone equally articulate and explanatory.
- Use short sentences only when they carry pressure. Avoid stacked short-line rhythm as a default.
- Vary sentence movement through perception, action, thought, and dialogue rather than mechanically alternating sentence lengths.
- Remove semantic echoes that restate the same judgment in narration, dialogue, and summary. Repetition must add pressure, correction, escalation, or a changed understanding.
- Do not start with authorial negation such as `Xではない`, `本当はX`, `後にX`, or `いずれX` unless the viewpoint character is actively thinking it.
- Do not announce themes before the scene earns them.
- Do not smooth characters into polite, cooperative, reasonable versions of themselves.
- Do not add chapter labels, author-planning language, or explanatory scaffolding inside prose.
- Do not overuse abstract boundary phrases such as `線を引く`. Prefer concrete actions: refuse, stop the recording, send someone home, end the conversation, move the phone, close the door, or put food on the table.
- When a concrete event can be named—playback resumed, a system restarted, someone arrived home, or someone re-entered—do not replace it with the vague stock phrase `戻ってきた`. Keep literal uses when a person or object actually returns and that return is the relevant action.
- Do not default to stock metaphors that use `置く` with abstractions such as `言葉を置く`, `返事を置く`, `答えを置く`, `沈黙を置く`, or `事実を置く`. Write the speech, action, pause, and ensuing reaction directly. Keep literal physical placement.
- Do not preserve a didactic binary contrast by rephrasing `AとBは別` or `AとBは同じではない` as a rhetorical question such as `AをBだと思っている？`. Show a distinction through action order, choice, and consequence.
- Do not use numeric pain scores such as `痛み二` or `痛み、三` as a default device in natural dialogue or characterization. Use a number only when a specific medical protocol, form, or clinician explicitly requires a scale and the scene establishes it. Otherwise show which motion hurts, heat, throbbing, numbness, loss of strength, limited range, guarding, breathing, refusal, or the need to stop. Do not flatten institutional characters into interchangeable checklist speakers.
- Do not remove a premise from dialogue merely because the characters could already know it. Let dialogue expose the speaker's purpose, shared or unequal knowledge, and the minimum premise needed for the turn. Characters may restate known facts when confirming, persuading, correcting, recording, assigning responsibility, or making an institutional request; make that repetition natural through relationship, stakes, and turn-taking without telepathic shorthand or an exposition dump.
- Use scene separators such as `----------------------------` when viewpoint or place changes abruptly and the contract permits that transition.

## Revision Checks

After drafting or editing, check:

- Did any wording change a locked fact, beat, role, reveal, continuity state, or end-state handoff? If so, revert the prose-layer change and report the higher-layer issue.
- Can the reader identify each speaker without excessive tags?
- Do the realized forms of address stay within the contract-approved range and preserve the locked relationship stage and emotional target?
- Did a replacement line make the following line unnatural?
- Does each non-urgent dialogue turn act on the listener, while meaningful terse speech stays terse?
- Did narration explain the future, announce a theme, or state information unavailable to the viewpoint?
- Are streaming or comment reactions based only on what viewers can actually see or hear under the contract?
- Did abstract AI phrasing, stock return language, binary maxims, checklist speech, or semantic repetition creep in?
- Did short sentence stacking or a mechanically uniform rhythm creep in?

If a passage feels off, remove explanatory filler before adding new prose. If the defect survives because the causal chain or contract is wrong, classify it as `STRUCTURE` or `SCENE_CONTRACT` rather than continuing synonym replacement.

## Maintenance Validation

When maintaining this skill, run `quick_validate.py` with Python UTF-8 mode through structured executable-and-argument fields. Do not reconstruct the validation as a shell command string.
