# A simple request to GitHub

> ## ⚠️ This whole repo will be published on GitHub
>
> Matt plans to publish the entire repo, including its full git history, on GitHub, and to serve the site from it. **Treat every commit as public from the moment it's made.** Rewriting history after pushing doesn't really take anything back.
>
> **The main thing to watch for: details about Matt's machine, network, and environment.** Never commit:
> - **Paths:** absolute or home-relative paths (`/Users/...`, `/home/...`, `~/...`, `/private/...`, `/Applications/...`), app-support, scratch, or temp folders, or OS-specific install locations. Use repo-relative paths. Refer to tools by name or by a variable such as `$CHROME`.
> - **Machine specifics:** usernames, hostnames, computer names, OS or kernel versions, hardware, installed-app lists, or shell and tool configuration.
> - **Networking:** IP addresses, internal hostnames (`*.local`, `*.lan`, `*.internal`), VPN or proxy details, Wi-Fi names, or ports of anything other than this repo's own preview server (`localhost:8765` is fine).
> - **Environment:** env var values, `.env` files, shell history, terminal output, logs, or screenshots of the desktop or terminal.
> - **Secrets:** tokens, keys, cookies, or anything that looks like one.
> - **Image metadata.** PNGs rendered with headless Chrome have none. Check any image that comes from somewhere else.
>
> **People in the demo are placeholders.** The site and mockups show `github-user-a` (the human) and `github-user-b` (the user whose agent posts), never a real person's handle. Matt commits under his own name and email (`mweberxyz`), and that's fine; his handle just doesn't appear on the site. Matt's GitHub email is public, but don't repeat it in repo content.
>
> **Public by design:** Matt's name (Matt Weber) and GitHub handle `mweberxyz` as commit author and in this file, the five cited repos, and the drafts in `outreach/` and `LAUNCH.md`. If the repo is published, these are visible on purpose.
>
> **Private context goes in `CLAUDE.local.md`** (gitignored). Machine paths, tool locations, environment notes, and private working context belong there, never here. Read it at the start of every session if it exists.
>
> **Before every commit**, run this check. Anything it prints needs a deliberate decision. The section above is expected to match its own examples.
> ```bash
> git diff --cached | grep -n -i -E '/(Users|home|private|var/folders|Applications|Library)/|~/|\b([0-9]{1,3}\.){3}[0-9]{1,3}\b|\.(local|lan|internal)\b|Darwin|ghp_|github_pat_|token=|password|secret|\.env' | grep -v 'CLAUDE\.local\.md'
> ```
>
> **Last audit: 2026-11-06.** Full history, all files, and PNG metadata were checked for paths, machine, network, and environment details, and for secrets. The only finding was the Chrome install path in the render commands, which was replaced with `$CHROME`.

## What this is

Matt is asking GitHub to **allow well-behaved agents to self identify**: a standard way for an agent to identify itself when it acts on GitHub, so what an agent posted can be told apart from what the person reviewed. How GitHub does it (a request header, a token setting, something else) and how it shows it are GitHub's call.

The goal is to keep a person's name meaningful on GitHub while agents post with their credentials. The question that matters is not "did a machine type this?" but "did the person named here look at this?"

This repo holds everything for the launch campaign:
1. **Feature request.** A GitHub Community discussion post: the problem, the evidence, one small ask.
2. **Demo site.** A friendly overview with an interactive demo and a call to action to support the request.
3. **Outreach.** A Reddit post for r/ClaudeAI (titled "A simple request to GitHub") and optional extra channels.

Everything is prepared first and launched together. See `LAUNCH.md` for the order.

## The proposal (settled decisions)

- **Match the length of popular requests.** Popular user requests in the category run about 30–125 words: first person, one pain, one ask, no headings (the long ones are GitHub staff posts). Keep ours around 200 visible words; a test fails above 250.
- **Lead with the problem, not a solution.** Product managers and programmers both push back on being handed a finished design. The request describes the problem and the evidence, then makes one small ask. No screenshots, no UI design, no tag styles, no endorse flow in the request.
- **The ask is self identification, nothing more.** The request doesn't ask for a header or a token setting. A brief "Possible implementations" section lists both as options. Anything that detracts from the core ask goes (no code demo, no open questions about mechanics).
- **The demo site still shows a possible UI** (the tag, Turbo). That's illustration, not part of the ask.
- **The site is a foil for the proposal.** Its job is to make people care enough to star the request, so the demo shows **one problem, sharply**: `github-user-b`'s agent posts a confident, plausible, wrong fix with that user's own token and no attribution, and `github-user-a` (the human, one comment) gives the real fix. The tag reveals which is which. No client is named on the agent, and everyone in the thread is a Member, so badges don't give the answer away. The opening line still speaks to the reader: "an agent using *your* token looks exactly like *you*. Same for everyone else in this thread."
- **Never use a real person as a demo user.** A real GitHub user stood in as user B with permission, then withdrew it (2026-11-06). Every reference was removed from the whole history. Placeholders only, avatars are a plain person icon (alice-dev keeps her "A"), and don't reintroduce the old handle anywhere.
- **Two pieces, two tones (on purpose).** The landing page is the hook: punchy, playful, reader-centric ("Spot the slop."), allowed to provoke. The feature request is the case: professional, measured, written for GitHub staff. They don't need to match word for word. The demo thread and the request's mockups differ, and that's intended. Don't bring the request's tone into the site or the site's tone into the request.
- **Non-goals:** AI detection, penalizing agent use, separate bot accounts.
- **Evidence of demand:** five verified repos already have their own workarounds (footers, signature lines, labels, separate identities): drivecore/mycoder#368, kornia/kornia#6223, humlab-speech/visible-speech-deployment#259, Adam-S-Daniel/_agent-guidance#319, noahdgrant/nightshift#682. They are cited in the request (so they also appear on the site's full-request page) and in the Reddit post.

- **Where to post:** GitHub Community discussions, category **💭 Other Feature Feedback, Questions, & Ideas** ("Product Feedback" type if asked), because the ask spans issues, PRs, reviews, and the API and no single product category owns it. Not *Apps, API and Webhooks*, *Copilot Conversations*, *Repositories*, or *Projects and Issues*. Afterwards, Matt leaves a short reply in his own words in the pinned "Which maintainer improvements would help you most?" discussion, linking to the request. Details in LAUNCH.md step 2.
- **Name of the ask:** "Allow well-behaved agents to self identify" (the request's title). "Agent attribution" is no longer the feature's name.
- **One name, one line.** Every title and preview uses the name *A simple request to GitHub* and the line *An agent using your token looks exactly like you.*, the same words the demo opens with. Landing tab: "Spot the slop · A simple request to GitHub". Preview and search text: "An agent using your token looks exactly like you. One small change would let GitHub tell you apart." The request page keeps the request's professional voice: tab "Allow well-behaved agents to self identify · Feature request". Change them together (a test checks they match).

## Layout

| Path | What |
|---|---|
| `request/feature-request.md` | GitHub discussion text. No images. Add the site link at the end after launch. |
| `site/index.html` | The landing page: one self-contained file with inline CSS and JS, light and dark themes. It **opens directly on the demo** (no hero): a GitHub-style thread with a "GitHub today | GitHub tomorrow" switch (no label above it), starting in "today" mode under the headline **"Spot the slop."** Visitors click the comment they think the agent wrote, then the page reveals the answer and switches to "GitHub tomorrow" (the agent tag, plus one tag-style control). **The thread must never move when switching today ↔ tomorrow or changing the tag style.** That's the point of the demo. To make that hold: the prompt is sized to its tallest message, the switch row is the same height in both modes (the tag-style control keeps its space while hidden in today; Turbo has no picker, it cycles looks on its own, and the issue body reserves the height of the tallest conversation so swaps never move the page), and on phones the comment headers stay on one line (short timestamps, no Member badge or "via", which moves into the tooltip). The only other control is **Boring | Turbo** (no label; screen readers get "Agent tag style"), at the right end of the switch row (its own line on phones), visible only in "tomorrow". Reset is next to the switch. The demo deliberately leaves out view-as, endorsing, and reader filters: they're in the full request, and in the demo they distracted from the puzzle. URLs and author are set in constants at the bottom of the file. |
| `site/request.html` | "View the full feature request" page. Renders `site/request.md` in the browser on every load (marked from jsdelivr), turning the `<!-- attach X.png -->` slots into the mockup images. Linked from the reveal ("Read the proposal →", via `NEXT_URL`) and from "The full request" in the top bar of `index.html`. It stays a local page while Matt iterates on the request; at launch the reveal link switches to the GitHub discussion. |
| `site/request.md`, `site/mockups` | **Symlinks** to `../request/feature-request.md` and `../mockups`. The request page always shows the current text and mockups, so edit the originals and never these. |
| `site/og.png` | 1200×630 link-preview image, rendered from `mockups/og-card.html`. |
| `mockups/*.html`, `mock.css` | `og-card.html` is the source of `site/og.png`. Mockups 1–4 are no longer used by the request (kept for now; they describe the old credential-based design). |
| `outreach/reddit-post.md` | Reddit post plus notes for r/github, HN, and social media. |
| `tests/demo.html`, `tests/run.sh` | Behavior tests for the site (see "Run the tests"). Not part of the deployed site. |
| `LAUNCH.md` | Launch checklist, step by step. |

## How to work on it

- **Preview the site:** `python3 -m http.server 8765 --directory site` (also set up in `.claude/launch.json` as `site`).
- **Re-render a mockup PNG** (2x) after editing its HTML. `$CHROME` is any Chrome or Chromium binary; set it in your own shell and never commit its value.
  ```bash
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 --window-size=1280,760 --screenshot="$PWD/mockups/1-comment-thread.png" "file://$PWD/mockups/1-comment-thread.html"
  ```
  Window heights used: 1→760, 2→730, 3→720, 4→710.
- **Run the tests** after any site change, and before committing it:
  ```bash
  CHROME="$CHROME" tests/run.sh
  ```
  `tests/run.sh` runs the whole suite twice, in light mode and then dark (it pins the theme; headless Chrome otherwise follows the machine's system theme). `tests/demo.html` loads the real site in frames at 1280, 1024, 375, and 360 px and checks the demo: the opening puzzle, right and wrong guesses, guessing again after going back to today, **no layout shift between states**, no horizontal scroll or header overflow, the tag control's place and options, reset during the reveal, reduced motion, and that the full-request page renders with its four images. The runner serves the repo on `localhost:8799` and exits non-zero on failure. You can also open `/tests/demo.html` in a browser from a server rooted at the repo to see the results. When you add demo behavior, add a pointed test for it.
- **Re-render the OG image** (1x, 1200×630) from `mockups/og-card.html` into `site/og.png`.

- **Motion:** the site respects `prefers-reduced-motion` with a single catch-all rule at the end of the `<style>` in `site/index.html` (no animation, transitions, or smooth scrolling), plus a check in the JS auto-scroll. New motion is covered automatically. Make sure every animated element still looks right in its final, unanimated state.

## Working agreements

- **Nothing goes out without Matt.** Claude never posts, deploys, files, or pushes anything external. Matt posts the request and the Reddit post personally, by hand. A proposal about labeling agent posts loses credibility if an agent posts it.
- **Facts get checked before they're cited.** Any link or claim that will appear under Matt's name is looked up first.
- **Iteration mode (since 2026-11-06):** Matt is iterating. Don't end turns with "what's next / ready to launch?" questions until Matt says they're ready.
- **Commit proactively.** After each meaningful change (a finished edit, a re-rendered asset, a decision applied), commit it without being asked. Keep each commit to one change, with a short message that says what changed and why. Re-render any PNG whose HTML source changed before committing, so assets never fall behind their sources. Local commits only. Never push or add a remote unless Matt asks.
- **Commits are GPG-signed.** Signing is on in this repo's local git config. Never use `--no-gpg-sign`, and don't change the signing settings. If signing fails, stop and tell Matt instead of committing unsigned.
- **Keep this file current.** Update CLAUDE.md in the same commit as the change it describes: check off Progress items, move the "← current" marker, add a dated Log line for decisions and findings, update "Placeholders still to fill" and "The proposal (settled decisions)" when they change, and remove anything that's no longer true. A new session should be able to read this file and pick up where the last one left off.
- Matt rewrites copy in their own voice. Treat the drafted text as a starting point, not final.

## Placeholders still to fill

- `acme/http-client` repo in the mockups and demo (fictional, on purpose).
- In `site/index.html`: `REQUEST_URL`, an absolute `og:image` URL, and the launch switch of `NEXT_URL`/`NEXT_LABEL` from the local request page to the GitHub discussion.
- In `site/request.html`: `REQUEST_URL` (keep it the same as in index.html) and an absolute `og:image` URL.
- Site link at the end of `request/feature-request.md` (after launch); `SITE_URL` and `REQUEST_URL` in `outreach/reddit-post.md`.

## Progress

- [x] Vision discussed and refined. The line that matters is "reviewed vs. not," not "human vs. machine."
- [x] Mockups 1–4 (comment tag, token settings, PR endorse/filter, tag styles).
- [x] Feature request draft, with evidence section.
- [x] Interactive demo site plus OG image, checked on desktop, mobile, and dark mode.
- [x] Reddit post draft and launch checklist.
- [x] Moved into this repo (2026-11-06).
- [x] "Full feature request" page on the site, rendered live from the request markdown.
- [ ] Iterate on content and design with Matt. ← **current**
- [x] Added `CLAUDE.local.md` (gitignored) for private, machine-specific context.
- [ ] Duplicate check: GitHub changelog plus community discussions.
- [ ] Decide on hosting. GitHub Pages serves from the repo root or `/docs` only, not `/site`, so either move the folder or use a Pages workflow. Either way, the deploy must **copy the symlinked files as real files** (e.g. `cp -RL site/ out/`), because hosts may not follow symlinks.
- [ ] Fill placeholders, then launch per `LAUNCH.md`.

## Log

- **2026-11-06:** Initial mockups, site, request, outreach drafts. A side session researched prior art and the five workaround repos were verified and added.
- **2026-11-06:** Added working agreements to commit proactively and keep CLAUDE.md current.
- **2026-11-06:** Cut the "What this isn't" section from the site to make it punchier. The Non-goals section stays in the feature request.
- **2026-11-06:** Added `site/request.html`, which renders the feature request live from the markdown via symlinks, so the site and the request can be reviewed together while iterating. The comparison table stacks on phones.
- **2026-11-06:** Clarified with Matt that the GitHub email and handle are already public, so commit authorship is fine but they shouldn't be repeated in files. The real concern is machine, network, path, and environment details. Re-audited: the Chrome install path in the render commands (in earlier commits) was the only finding, and it's now `$CHROME`.
- **2026-11-06:** The repo will be published on GitHub with full history. A privacy audit found nothing to fix; the only identifying detail is the commit author email. Added the public-repo warning section and a pre-commit check to the top of this file.
- **2026-11-06:** Added a gitignored `CLAUDE.local.md` for private, cross-session context, and moved machine-specific notes into it.
- **2026-11-06:** Re-signed all commits with Matt's GPG key (contents and author dates unchanged) and turned on signing for this repo.
- **2026-11-06:** Landing page principle: the demo hooks people, and the full feature request is where they go next. Anything the request already covers well comes off the landing page. Removed "The proposal: four small pieces" and replaced it with a prominent "Read the full feature request" card right below the demo.
- **2026-11-06:** Landing page now opens directly on the demo, to stand apart from generic AI-made landing pages (no big centered hero, kicker pill, or sidebar). The hook is a guess: two mweberxyz comments look identical today, and one was never read by mweberxyz. Picking one reveals the answer and the proposal's tag. Checked on desktop and phone, in light and dark.
- **2026-11-06:** Renamed the demo switch to "GitHub today | GitHub tomorrow" and removed the "Show it as" label.
- **2026-11-06:** Removed all layout shift between GitHub today and GitHub tomorrow (prompt height, toolbar, header wrapping, color picker). Verified identical positions at 1280, 1024, and 375 px.
- **2026-11-06:** Switched to Matt's real identity: every `mweber` is now `mweberxyz` (demo, mockups, OG image), and the footer credits Matt Weber with a link to github.com/mweberxyz. Re-rendered all PNGs. The longer handle needed a wider demo container (one-row controls from 1150px); re-verified no layout shift at 1280, 1024, and 375 px.
- **2026-11-06:** Cut everything after the demo on the landing page (quote, problem cards, workaround cards, call to action, footer). The page is now: top bar → demo → full-request card. Supporting the request lives in the top bar, and the evidence and explanations live in the full request.
- **2026-11-06:** The opening prompt now speaks to the reader: "an agent using *your* token looks exactly like *you*". "your" and "you" get a tilted, full-height highlighter stroke (extends above and below the letters) that draws in on load (static when reduced motion is on).
- **2026-11-06:** Headline is now **"Spot the slop."** (Matt's call). The demo thread was rewritten to justify it: the agent's comment is plausible and passes locally (lowers the keep-alive timeout, "0 failures in 20,000 requests") but misses the real problem, and mweberxyz's follow-up supplies the insight (that only moves the race; honor `Keep-Alive: timeout` and retry idempotent requests on `ECONNRESET`; closes the agent's PR). Visitors now pick the *agent's* comment. The landing page can be punchy; the feature request keeps its professional tone.
- **2026-11-06:** Matt confirmed the two-tone split: the site is punchy and the feature request stays professional, so the mockups keep the original wording.
- **2026-11-06:** The "GitHub today | GitHub tomorrow" switch is now large (18px, sliding purple highlight) and is the only control above the thread; the rest moved below it. When a guess flips the switch from the opening state, it plays a reveal: the highlight eases across with a slight overshoot, the switch swells with a pulse ring, and the agent tag pops in about 1s later. Reset cancels the animation. Nothing animates when reduced motion is on.
- **2026-11-06:** Reduced-motion audit. Six motions weren't covered (smooth scroll, JS auto-scroll, comment hover lift and hint fade, endorsed event pop, endorse banner flash, switch label fades). Replaced the separate rules with one catch-all and made the JS scroll respect the setting. Verified by applying the rule and running the whole demo: no running animations, and every final state is correct.
- **2026-11-06:** Fix: comments are clickable whenever the demo is in "today" mode, including after going back from tomorrow ("Can you still spot it?"). Each guess replays the reveal.
- **2026-11-06:** Added `tests/` (38 checks across 4 widths). On its first run it found a real bug: at 360 px a 16-character custom tag suffix overflowed the comment header. Fixed by truncating the tag label with an ellipsis on narrow screens (the tooltip is unaffected).
- **2026-11-06:** Removed "Closing #4190." from mweberxyz's comment. That kind of authority gave away which comment was the human's.
- **2026-11-06:** Thread restructured (Matt's idea): Alice now asks "What's the right fix?" and both mweberxyz replies answer her independently with contradicting advice. Agent: lower the timeout to 4s, passes locally. Human: no fixed timeout can win; honor `Keep-Alive: timeout=5` and retry idempotent requests on `ECONNRESET`. Neither reply refers to the other, so the only way to spot the slop is to judge the advice. Reveal copy: "Same name, opposite advice."
- **2026-11-06:** Two problems, one fix (Matt's framing): added a reply from `drive-by-dev`'s agent (generic, unattributed slop) ahead of mweberxyz's agent and human replies. "Spot the slop" now has an easy catch and a hard one, with three guess outcomes ("That's one…", "Good eye…", "Nope…"), and the reveal tags both agents. Endorsing removes only mweberxyz's tag. Tests updated (42 checks).
- **2026-11-06:** Back to one problem (Matt: punchier). mweberxyz leaves a single, human comment; the agent reply now belongs to `ozzie-dev` (renamed from drive-by-dev, whose name was itself a tell), and it uses the technical, data-backed wrong fix instead of obvious slop. View-as and endorse now act as ozzie-dev. Tests back to 38.
- **2026-11-06:** Renamed the agent's owner from ozzie-dev to `github-user-b`, a real person who gave Matt permission to be used as the stand-in. Tests pass.
- **2026-11-06:** Clicking "GitHub tomorrow" (or "Show me tomorrow →") now pops the agent tag in too, with a shorter delay (0.2s) than the guess reveal (1s) so it lands as the highlight arrives. It only plays on the switch to tomorrow, not on later changes. Test added (42 checks).
- **2026-11-06:** Dropped the "Like where this is going?" card (generic, and it competed with the puzzle). The next step now appears in the reveal itself, "Read the proposal →", only after a guess or in tomorrow. It points at the local request page for now so Matt can see the request while iterating; it becomes the GitHub link at launch (LAUNCH.md step 3).
- **2026-11-06:** Site: removed the Grey tag option; the demo's tag is purple with the glyph by default, and the only other choice is "Mine". A stored "grey" preference falls back to purple. The feature request still presents options A/B/C. Test added (50 checks).
- **2026-11-06:** All three users in the demo thread are now Members (alice-dev, github-user-b, mweberxyz).
- **2026-11-06:** Role badges now sit on the right of every comment header, as on GitHub. The hover hint in today mode ("I think an agent wrote this") is a small pill floating on the comment's top border, so it takes no space in the header. Test added for badge alignment (54 checks).
- **2026-11-06:** Simplified the demo (Matt: the optional controls detracted from it). Removed View as, endorsing, and the Show/Collapse/Hide filter from the site; the feature request still covers them. The tag style control moved above the thread, flush right in the switch row, and its options are now **Boring** (purple) and **Turbo** (your color and suffix, in a small floating picker). Copy now just says "Hover the tag." Tests: 50 checks.
- **2026-11-06:** mweberxyz's reply now comes before github-user-b's agent, and both say "commented 2 hours ago" (2h ago on phones), so neither order nor timing gives away which one is the agent. The wrong-guess copy now says "the confident fix below it".
- **2026-11-06:** Turbo now asks to be pressed: bigger (16px, bold), rainbow text that keeps flowing, a ring and glow that cycle through colors, and a little wiggle every few seconds until someone picks it. Reduced motion leaves a still rainbow. Tests check the animations (50 checks).
- **2026-11-06:** Dropped the "Tag" label in front of Boring | Turbo; the control explains itself next to the tag. It keeps an accessible name for screen readers.
- **2026-11-06:** Turbo no longer has a color and suffix picker (choosing detracted from the point). Instead it cycles on its own every 2s through looks someone could build on the agent flag: agent · triage (blue), night shift (yellow), deps (red), docs (pink), flaky tests (orange), each with a small pop. No green, so it never reads as "verified". The idea: here's what can be built on top of this primitive. The cycle runs only while Turbo is showing in tomorrow; Boring and Reset stop it. Saved tag preferences (localStorage) are gone. Tests: 54 checks.
- **2026-11-06:** Boring | Turbo toggle is bigger (15px buttons with more padding; Turbo 17px). Still fits in the switch row on desktop, so nothing moves.
- **2026-11-06:** Turbo now swaps the whole conversation, not just the tag, so each label makes sense for what the agent says: triage (labels a docs-search regression, flags a likely duplicate), night shift (bisects an overnight CI break and opens a pin PR), deps (opens a parser bump with a changelog summary), docs (drafts a missing API entry), flaky tests (failure stats and a fake-timers fix). Same cast and order in each: alice-dev asks, mweberxyz answers, github-user-b's agent follows. These agents are useful, not wrong; the puzzle thread is the only one where the agent misses. Cycle slowed to every 5s so people can read (later 10s, see below). Each swap fades the issue in. Tests: 58 checks.
- **2026-11-06:** Turbo now changes every 10s (was 5s): each change is a whole new conversation, which takes longer to read than a tag.
- **2026-11-06:** Added a countdown bar along the bottom of the GitHub window while Turbo cycles. It fills over the 10s (`TURBO_MS`, one constant for both the bar and the timer) and takes the current tag's color. Boring hides it; it takes no layout space. Test gotcha: a test that leaves Turbo cycling makes the headless runner hang, so tests that turn Turbo on reset in a `finally`. Tests: 62 checks.
- **2026-11-06:** Removed "A simple request to GitHub · a proposal" from the top bar; it now holds only "The full request" and "Support it ↗", on the right. With the room freed, "The full request" shows on phones too. The page title and OG card still carry the name.
- **2026-11-06:** Turbo now changes every 7s (was 10s; 10 felt slow).
- **2026-11-06:** Left and right arrow keys step through the Turbo conversations (wrapping around) and restart the countdown. They do nothing unless Turbo is cycling, or with a modifier key held. Tests: 66 checks.
- **2026-11-06:** Accessibility pass. Guessing works by keyboard: each reply has a real "I think an agent wrote this" button (the old hover pill), and a keyboard guess moves focus to the revealed tag. The agent tag is a button named by its label and described by its tooltip; Escape hides the tooltip. Turbo has pause/play and previous/next controls in the window's top bar (it changes content on its own, so it needs a pause: WCAG 2.2.2), and it holds while focus is in the thread. The live prompt is only rewritten (and re-announced) when its text changes, not on every Turbo swap. Contrast: light-theme muted text darkened to 5:1 on both pages, and the Turbo rainbow uses darker stops in light mode and a lighter purple in dark mode (all at least 4.5:1). The Turbo wiggle stops after four nudges. Also: avatars hidden from screen readers, issue title is an h2, Reset's accessible name matches its text and it has a 32px target, visible focus rings, and new-tab links say so. Request page: mockups are figures with descriptive alt text separate from the captions. Tests: 86 checks.
- **2026-11-06:** Made the titles and metadata consistent (see "One name, one line"). Replaced the generic tab titles ("Agent-Tagged Posts", "The Feature Request") and the first-person preview line ("Let me tell people when an agent posted for me") with the reader-facing line from the demo. Re-rendered og.png. Tests: 87 checks.
- **2026-11-06:** Renamed the feature from "agent sessions" to **agent attribution** everywhere (Matt): request title and text, API field (`agent_attribution`), mockups 1 and 2 (tooltip, token setting labeled "Attribution"), site tooltip ("X turned on agent attribution for this token"), request page title, alt text and captions, Reddit draft, and this file. Re-rendered mockups 1 and 2. "Session" now only means a working session (Claude's or a browser's).
- **2026-11-06:** Rewrote the feature request (Matt: tone it way down; nobody wants to be handed a solution). New title: "Allow well-behaved agents to self identify". Problem first, then the evidence (the five repos), then one small ask: a request header like `X-GitHub-Agent` that agents send on every API call, with one `gh api` example. Dropped all screenshots, the credential-level design, endorse, filters, tag styles, and the "existing mechanisms" table (one sentence on bot accounts and trailers stays). The site link comes after launch. The request page no longer handles image slots or `SITE_URL`. Mockups 1–4 are now unused.
- **2026-11-06:** Narrowed the request again (Matt: don't even ask for the header). "The ask" is now only agent self identification, plus one line that it's for agents that want to behave well (not detection, no change in permissions). A brief "Possible implementations" section lists a request header and a token setting. Dropped the `gh api` example, "What this isn't", and the open questions.
- **2026-11-06:** Matt decided where to post (worked out in a side session that looked at github.com/orgs/community/discussions): *Other Feature Feedback, Questions, & Ideas*, plus a short reply in the pinned maintainer-improvements discussion. Recorded in LAUNCH.md, the request's top comment, and the settled decisions above.
- **2026-11-06:** Cut the request from 434 to about 200 words to match popular requests in the category (sampled the top ones: 30–125 words, first person, no headings). Now four short paragraphs plus the two implementation options; the five repos are one line of links. Added a link to "Allow to mute bots" (community discussion #5793, Matt's idea): agents using a person's token can't be muted because they look like that person.
- **2026-11-06:** Trimmed the request further (Matt): dropped the reviewed/unreviewed framing, which came from the original endorse-based design. The problem is now just that an agent using my token looks exactly like me. Added "What comes next" after the implementation options: a marker by the name, muting or filtering agents (linked to "Allow to mute bots"), and marking an agent's post as reviewed. About 170 visible words.
- **2026-11-06:** The marker next to the author's name is part of the core ask, not a next step (Matt). Moved it into the ask; "What comes next" (later renamed "What this would enable") is now muting/filtering and marking posts as reviewed.
- **2026-11-06:** Renamed "What comes next" to "What this would enable" (Matt picked it from options): it shows what the ask makes possible without reading like a roadmap or extra scope.
- **2026-11-06:** Added a third "What this would enable" item (Matt's idea): pinging someone's agent instead of the person, to cut their notification volume.
- **2026-11-06:** Cut "This is for agents that want to behave well. It isn't detection, and it doesn't change what an agent is allowed to do." The title already says well-behaved, and the detection objection can be answered in replies. The ask is now one sentence.
- **2026-11-06:** The stand-in for user B withdrew permission. Rewrote all 59 commits: that handle became `github-user-b` everywhere (files and commit messages), and Matt's handle in the site and mockups became `github-user-a` (commit authorship and this file keep `mweberxyz`). Re-signed every commit. Avatars for both users are now a plain person icon instead of initials. Re-rendered mockups 1–4 and og.png. The old history is kept only in the local ref `refs/backup/pre-rename` until Matt deletes it.
- **2026-11-06:** Result copy (Matt): "Same thread, GitHub tomorrow" now speaks to the reader like the opening ("The token your agent used marks everything it posts, right next to your name."); the two guess results say "the second user's" instead of the handle.
- **2026-11-06:** "Support it" buttons now read "Add your 👍 ↗" (landing) and "Add your 👍 on GitHub ↗" (request page): the concrete action that counts on a GitHub discussion.
- **2026-11-06:** Simplified the guess results (Matt): both now end "…with the second user's token, and nobody can tell the difference." followed by "Read the proposal →". Dropped the timeout explanation, the "with this proposal the token marks it" lines, and "Hover the tag" from those two.
- **2026-11-06:** It's a request, not a proposal (Matt). The post-guess link now reads "Join the discussion →" ("Join the discussion ↗" at launch, when it points at GitHub). The request page's preview title says "the full request".
- **2026-11-06:** Tests now run in both themes: `run.sh` does a light pass and a dark pass (via `--blink-settings=preferredColorScheme`). Until now the suite silently followed the machine's system theme. Added a contrast sweep that checks every visible text against the real background behind it, in each demo state and on the request page, with transitions off so it measures final colors. Confirmed it catches a deliberately faint color. 88 checks per theme.
