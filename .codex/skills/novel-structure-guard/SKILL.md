---
name: novel-structure-guard
description: Project-local structural workflow for Japanese novel outlines, scene plans, and structural revisions. Use for scene order, causality, character wants and roles, information disclosure, injury/possession/time continuity, structural spoilers, scene contracts, and chapter-end connections. Do not use it for sentence-level dialogue, narration, vocabulary, or rhythm polishing.
---

# Novel Structure Guard

## Purpose

Use this skill only for this novel project. Own `STRUCTURE` and the creation or revision of `SCENE_CONTRACT` documents. Make each scene serve its intended causal, relational, informational, temporal, or atmospheric function while remaining character-driven, knowledge-valid, continuous with surrounding scenes, and connected to the next chapter. Lived time, ordinary relationship, atmosphere, and unrecovered world detail may justify a scene or beat without plot payoff.

Do not polish dialogue, narration, vocabulary, or sentence rhythm here. Report those findings as `PROSE` and use `$novel-prose-guard` after the structure and contract are settled.

## Three-Layer Triage

Classify each finding before proposing a change:

- `STRUCTURE`: outline or scene order, cause and effect, character wants or roles, information disclosure, injury/possession/time continuity, structural spoilers, or chapter-end connection.
- `SCENE_CONTRACT`: the invariant interface for a scene or arc: viewpoint, time, place, participants, channel state, known and unknown information, permitted or required forms of address, relationship stage, emotional target, start state, required beats, forbidden outcomes, end state, and handoff.
- `PROSE`: dialogue, narration, vocabulary, speaker identification, natural surface realization of contract-approved forms of address, abstract expression, repetition, or sentence rhythm. Leave its wording to `$novel-prose-guard`.

For a mixed request, resolve in this order: `STRUCTURE` → `SCENE_CONTRACT` → `PROSE`. Do not let a polished sentence decide the structure.

## Required Reading Before Structural Work

Identify the target family first. Read the common sources plus only the matching family route; do not treat every file in the repository as one continuity domain.

Common sources for every target:

1. `本文構造指針.md`.
2. The applicable `本文場面契約_<編名>.md`. When creating a missing contract, also read `本文場面契約_テンプレート.md`. For the current Israfael arc, use `本文場面契約_イスラフェル編.md`.
3. `本文文体指針.md` to preserve the prose boundary while auditing existing text.
4. The target outline, scene plan, or chapter, plus its actual previous and next scene or chapter when they exist.

### Repository-Root Crossover Targets

Use this route for crossover files stored at the repository root, such as `本文_仮04_*.md`, `本文_仮05_*.md`, and other root `本文_*.md` files.

Read only the root planning and research sources relevant to the requested arc:

- `長編大枠再構築.md` as the active overall structural source. Treat `長編全体再構築_事件駆動版.md` as discarded and non-authoritative; read it only when the user explicitly requests historical or discarded-plan comparison, and never use it to decide current structure.
- `本文掲載順詳細話数構成.md` for reader order and actual adjacency.
- `全111話人物知識・読者開示台帳.md` for knowledge and reveal continuity.
- `全111話人物関係・内的劇配置表.md` for relationship and internal-drama placement.
- Only the `作品調査_<作品名>.md` files for works and characters actually present.
- Any other root source directly named by the structure guide, scene contract, target, or user.

Do not require `main_novel/*` files for this route unless an authoritative root source or the user explicitly makes one relevant.

### `main_novel/` Targets

Use this route only when the target is under `main_novel/`:

- `main_novel/gpt_handoff.md` and `main_novel/gpt_notes.md`.
- Relevant project sources:
  - `main_novel/settings.md`
  - `main_novel/settings_streamers.md`
  - `main_novel/memo_kotoha.md`
  - `main_novel/memo_stream_store.md`
  - `main_novel/memo_ch4_akane_yura_amagi.md`
  - `main_novel/detail_amagi_mizuhara.md`
  - `main_novel/comments.md` when comments or bulletin-board material affect information flow.
- `main_novel/user_written_style_samples.md` only when an existing passage must be inspected to distinguish a structural defect from a prose defect.

If no applicable scene contract exists and the requested task already authorizes drafting or revision, derive and create the minimal contract in the same task from the structure guide, contract template, target and adjacent files, and relevant family sources, then continue. Do not add an approval, passcode, new-task requirement, or blanket refusal solely because the contract file was missing. Ask only when a material story choice remains genuinely unresolved.

## Scene Contract Discipline

Before changing an outline or scene:

1. Identify the applicable contract and its scope.
2. Record the start state: viewpoint, time, place, participants and absences, stream/mic/camera state, injuries, fatigue, possessions, knowledge, permitted or required forms of address, relationship stage, emotional target, and unresolved pressure.
3. Record the scene purpose, each present character's want and role, required beats, prohibited outcomes, and the permitted information path.
4. Record the end state and the exact question, decision, cost, threat, promise, or constraint handed to the next scene.
5. Compare the proposed structure against those fields. Label mismatches as `SCENE_CONTRACT` instead of silently editing the contract.

Change a contract only when the user changes the intended design or explicitly asks to repair the contract. Update the contract first, identify downstream scenes invalidated by that change, then revise the outline. Do not bend the contract merely because a local passage is difficult to phrase.

## Structural Workflow

1. Identify each scene or beat's intended function: causal, relational, informational, temporal or lived-time, atmospheric, or a supported combination. For a causal unit, map `input state → character want → action or decision → consequence → changed state → next-scene pressure`. For another function, state the experience, relationship movement, information placement, passage of time, or atmosphere it preserves without inventing a plot payoff.
2. Verify that the scene placement serves its intended function and does not break surrounding state. Remove, compress, or combine a scene or beat only when that intended function is absent or accidentally duplicated. Do not remove lived time, ordinary relationship, atmosphere, or unrecovered world detail merely because it lacks a later payoff.
3. Test every consequential action against what the acting character knows then, what they want, what they fear, and what options they can actually take.
4. Track information by observer and channel. Distinguish seen, heard, inferred, reported, recorded, streamed, camera-only, mic-off, and comment-only information.
5. Track injuries, fatigue, mobility, clothing or equipment when relevant, possessions, custody, entrances and exits, travel time, clock time, and elapsed time across the scene boundary.
6. Check that discovery and analysis proceed from available evidence rather than from the author's eventual answer.
7. Check the final beat as a causal handoff, not a summary or theme statement.
8. When a premise changes the purpose of downstream scenes, return to the first changed causal branch and rebuild forward. Do not preserve the obsolete blame, comparison, training, or dialogue structure through local substitutions.
9. After structure and contract pass, hand sentence-level work to `$novel-prose-guard` without reopening settled invariants.

## Structural Rules

- Keep causal chronology distinct from reader order. A later reveal may explain an earlier event, but the earlier scene must still be motivated by the knowledge and pressure available at that time.
- Do not force every concrete detail, ordinary action, or atmospheric beat into consequence, symbolism, clue, foreshadowing, or later recovery. Preserve supported world texture and lived time without manufacturing plot work for them.
- Do not leak a condition discovered later into pre-discovery commands, movement, target choice, timing, comparisons, or attacks merely by withholding its name. Do not make a first encounter accidentally satisfy, test, or foreground a rule that later analysis has not revealed.
- In analysis or deduction scenes, follow the evidence in scene order: observation, anomaly, hypothesis, confirmation, then the next actionable condition. Do not use the eventual conclusion as the first comparison axis.
- Preserve character agency. Warnings, expertise, institutional authority, or plot convenience do not erase a character's established desire, refusal, fear, curiosity, or limit.
- Keep roles distinct. Do not transfer another character medical, tactical, investigative, emotional, or explanatory function merely to make a scene efficient.
- Reveal information through a valid observer and channel. Do not give viewers mic-off speech, off-camera action, private knowledge, or later deductions.
- Treat a structural spoiler as more than an explicit statement. Prematurely optimal behavior, suspiciously selected measurements, unexplained timing, or an early scene arranged around a later rule can reveal the answer even when no one names it.
- Preserve injury and possession continuity until an on-page event changes it. Track who carries, gives, loses, repairs, consumes, sees, or knows about an item.
- Make time causal. Travel, recovery, sleep, broadcasts, medical procedures, and simultaneous actions must fit the stated or inferable elapsed time.
- End a chapter by changing the available choice or pressure. The final beat must supply a live connection to the next scene through consequence, decision, cost, threat, promise, or constraint.

## Project Character and Continuity Guardrails

Keep these established constraints in structural decisions and scene contracts:

- Yura understands danger and refusal, but she does not stop. Her desire to see, know, and test is the engine. Do not make her a good listener, a responsible observer, or someone who avoids trouble after being warned.
- Yura's interest is magical curiosity, not patient care. If she uses rescue, consent, or medical language, treat it as a tool or convenience unless the scene has earned otherwise.
- Minato's food is not a negotiation where he asks the other person to design the meal. He quietly considers the person and cooks.
- Minato, Mizuki, and Kotoha do not make formal acceptance conditions for visitors. They protect the kitchen, the house, and Kotoha through ordinary refusals and household actions. Do not turn their judgment into a checklist, contract negotiation, or policy discussion.
- Mizuki is not only strong. Keep fear, hesitation, anger, and ordinary human limits visible.
- Akane begins from hunger, pain, sleeplessness, and the desire to live. Do not replace that with clean slogans too early.
- Kotoha's paper signals are concrete: circle means yes, horizontal line means no, dot means not yet or undecided, and short vertical line means stop or return. Do not make the dot mean no.
- Minato does not carry Kotoha outside. He waits while she chooses and walks. He supports her after she chooses to return or reaches out.
- Mizuhara is not cold or inhuman. She genuinely wants to treat patients.
- Mizuhara does not initially know the full old-house situation. She starts from Akane's small medical changes, then hears about the viral cooking-stream clip at Amagi Medical. Do not make her connect everything too early.
- Amagi Medical includes sincere doctors, nurses, and researchers. The horror is that their real patient care can be routed into Reiji's system.
- Do not involve Kusakabe in Guild or Kugayama contact lines. Kusakabe is unrelated to the Guild.

## Structural Review Output

For each finding, report:

- classification: `STRUCTURE`, `SCENE_CONTRACT`, or `PROSE`
- source evidence and the affected scene boundary
- current input and end state
- missing or duplicated causal, relational, informational, temporal, atmospheric, role, continuity, or handoff function
- smallest structural repair that preserves user intent
- downstream scenes or contracts that must be rechecked

Separate verified facts from inferences and unknowns. A sentence-level preference alone is not evidence for changing structure.

## Completion Checks

- Is each scene or beat's intended causal, relational, informational, temporal, or atmospheric function present and non-duplicative? For causal units, does the input-to-consequence chain hold without forcing non-causal detail into payoff?
- Does each character act from their own current knowledge, desire, role, and limit?
- Does every reveal have a valid observer, channel, and time?
- Are injuries, possessions, entrances, exits, and elapsed time continuous?
- Does any early behavior or measurement structurally reveal a later answer?
- Does the applicable scene contract still match exactly?
- Does the final beat cause or constrain the next scene?
- Were `PROSE` findings left for `$novel-prose-guard` instead of being silently rewritten here?

## Maintenance Validation

When maintaining this skill, run `quick_validate.py` with Python UTF-8 mode through structured executable-and-argument fields. Do not reconstruct the validation as a shell command string.
