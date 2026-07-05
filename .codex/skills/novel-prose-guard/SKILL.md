---
name: novel-prose-guard
description: Project-local prose workflow for GPT-Novel. Use when drafting, revising, reviewing, or continuing Japanese novel text in this repository, especially files under main_novel/ch*.md, scene outlines, character scenes, dialogue, narration, or style-sensitive edits. Before writing prose, read the project handoff, notes, user-written style samples, relevant settings/memos, and adjacent chapters.
---

# Novel Prose Guard

## Purpose

Use this skill only for this novel project. Its job is to prevent GPT-style drift before writing or revising prose.

The core rule: before writing novel text, read the summarized project cautions and the user's own prose samples, then write within the viewpoint, information path, and character logic already established.

## Skill Growth

Treat this skill as a project-specific prose memory, not a finished static rule.

When the user identifies prose as their own writing, or says a passage is close to their style, add or update an entry in `main_novel/user_written_style_samples.md`. Preserve enough source text or file/line anchors to recognize it later.

When the user points out a recurring GPT failure, update this skill if the failure is general. Update a character memo or settings file if the failure is character-specific.

Typical failures to fold back into this skill:

- Short sentence stacking used as artificial rhythm.
- Authorial explanation that states the meaning before the scene earns it.
- Viewpoint leakage from later plot knowledge.
- Characters becoming too obedient, polite, careful, or explanatory.
- One-line substitutions that break the next line of dialogue.
- Surface-level paraphrase that ignores character motive.

The goal is not to copy the user's prose mechanically. The goal is to write project-native original prose by using the user's judgment patterns: viewpoint discipline, information routing, character motive, restraint, and pressure in dialogue.

## Required Reading Before Prose

Before drafting or editing any prose scene, read these files in order:

1. `main_novel/gpt_handoff.md`
2. `main_novel/gpt_notes.md`
3. `main_novel/user_written_style_samples.md`
4. The target chapter or scene file.
5. The previous and next chapter when they exist.
6. Relevant settings/memos for the scene:
   - `main_novel/settings.md`
   - `main_novel/settings_streamers.md`
   - `main_novel/memo_ch4_akane_yura_amagi.md` for Akane, Yura, Amagi, final-arc material.
   - `main_novel/detail_amagi_mizuhara.md` for Mizuhara and Amagi Medical.
   - `main_novel/comments.md` for comment threads or bulletin-board sections.

If the user is only giving text to be received, do not rewrite it until instructed.

## Writing Workflow

Before writing, determine:

- Viewpoint character.
- What that character knows, does not know, and only guesses.
- Whether the scene is streaming, off-stream, mic-off, camera-only, or comment-only.
- Which characters are present and what each one wants.
- Which existing user-written samples are closest to the requested scene.

When editing, do not patch one line in isolation. Read the surrounding exchange and make sure the next response still fits.

When generating original prose, first choose the closest sample from `user_written_style_samples.md` and state internally what it teaches: sentence flow, viewpoint distance, dialogue pressure, or character handling. Do not imitate only the surface rhythm.

## Tool Encoding

On Windows, run Python-based skill tools in UTF-8 mode. This avoids CP932 decode failures when validating or reading Japanese skill files.

Use:

```powershell
python -X utf8 C:\Users\hsrsk\.codex\skills\.system\skill-creator\scripts\quick_validate.py Z:\novel\.codex\skills\novel-prose-guard
```

Do not use plain `python ...quick_validate.py` for this project skill unless the environment is already UTF-8.

## Style Rules

Prefer the user's prose logic over GPT polish.

- Keep narration tied to what the viewpoint character can perceive.
- Let actions, timing, and dialogue carry meaning before adding explanation.
- Use short sentences only when they have pressure. Avoid stacked short-line rhythm as a default.
- Do not start with authorial negation such as "Xではない", "本当はX", "後にX", or "いずれX" unless the viewpoint character is actively thinking it.
- Do not announce themes before the scene earns them.
- Do not smooth characters into polite, cooperative, reasonable versions of themselves.
- Do not add clarifying labels like chapter numbers or author-planning language into prose.
- Use scene separators such as `----------------------------` when viewpoint or place changes abruptly.

## Character Guardrails

- Yura understands danger and refusal, but she does not stop. Her desire to see, know, and test is the engine. Do not make her a good listener, a responsible observer, or a person who avoids trouble after being warned.
- Yura's interest is magical curiosity, not patient care. If she uses rescue, consent, or medical language, treat it as a tool or convenience unless the scene has earned otherwise.
- Minato's food is not a negotiation where he asks the other person to design the meal. He quietly considers the person and cooks.
- Mizuki is not only strong. Keep fear, hesitation, anger, and ordinary human limits visible.
- Akane begins from hunger, pain, sleeplessness, and the desire to live. Do not replace that with clean slogans too early.
- Mizuhara is not cold or inhuman. She genuinely wants to treat patients.
- Do not involve Kusakabe in Guild or Kugayama contact lines. Kusakabe is unrelated to the Guild.

## Revision Checks

After drafting or editing, check:

- Does any sentence reveal information the viewpoint character cannot know?
- Did a character become more obedient, polite, or explanatory than their established behavior?
- Did a replacement line make the following line unnatural?
- Did narration explain the future instead of staying in the scene?
- Are streaming/comment reactions based only on what viewers can actually see or hear?
- Did GPT-style short sentence stacking creep in?

If a passage feels off, remove explanatory filler before adding new prose.
