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
> **Already public, but still don't copy it into files:** Matt's GitHub email and the `mweberxyz` handle are public through Matt's GitHub activity, so commit authorship is fine as it is. Being public elsewhere is no reason to repeat them in repo content, so leave them out unless they serve the site (for example `AUTHOR_URL`).
>
> **Public by design:** Matt's first name, the placeholder `mweber` handle in the mockups, the five cited repos, and the drafts in `outreach/` and `LAUNCH.md`. If the repo goes public before launch, those drafts are visible early, so time the visibility switch with launch.
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

Matt is asking GitHub for a feature: let a credential (PAT, OAuth grant, GitHub App user token, `gh` login) be marked as an **agent session**. Anything created with it shows an `agent` tag next to the user's name, so readers can tell what the person actually reviewed from what an agent posted on their behalf without review.

The goal is to keep a person's name meaningful on GitHub while agents post with their credentials. The question that matters is not "did a machine type this?" but "did the person named here look at this?"

This repo holds everything for the launch campaign:
1. **Feature request.** A GitHub Community discussion post with mockups.
2. **Demo site.** A friendly overview with an interactive demo and a call to action to support the request.
3. **Outreach.** A Reddit post for r/ClaudeAI (titled "A simple request to GitHub") and optional extra channels.

Everything is prepared first and launched together. See `LAUNCH.md` for the order.

## The proposal (settled decisions)

- **The credential carries the session type.** Personal (the default) or Agent, fixed when the credential is created, so the client can't remove the tag. A label the client applies to itself is not reliable.
- **An `agent` tag next to the user's own name,** in the same family as the existing `bot` label. It stays the same account and the same responsibility. Hovering explains the tag. "via <agent name>" shows the name the user gave the agent.
- **Endorse as mine.** The user reviews an item and endorses it. The tag is removed and the timeline records the endorsement.
- **Filters.** Readers and maintainers can show, collapse, or hide unreviewed agent activity, with matching notification filters and an API field (similar to `performed_via_github_app`).
- **Tag style options:** A grey (like `bot`), B purple with a robot glyph (planned lead recommendation), C user-chosen color and suffix. In C the glyph, the word "agent", and the shape are fixed, and green isn't offered so the tag can't look like a "verified" badge.
- **Non-goals:** AI detection, penalizing agent use, separate bot accounts.
- **Evidence of demand:** five verified repos already have their own workarounds (footers, signature lines, labels, separate identities): drivecore/mycoder#368, kornia/kornia#6223, humlab-speech/visible-speech-deployment#259, Adam-S-Daniel/_agent-guidance#319, noahdgrant/nightshift#682. They are cited in the request, on the site, and in the Reddit post.

## Layout

| Path | What |
|---|---|
| `request/feature-request.md` | GitHub discussion text. Has `SITE_URL` placeholder and image slots. |
| `site/index.html` | The demo site: one self-contained file with inline CSS and JS, light and dark themes. URLs and author are set in constants at the bottom of the file. |
| `site/request.html` | "View the full feature request" page. Renders `site/request.md` in the browser on every load (marked from jsdelivr), turning the `<!-- attach X.png -->` slots into the mockup images. Linked from the call-out card right below the demo and from the CTA on `index.html`. |
| `site/request.md`, `site/mockups` | **Symlinks** to `../request/feature-request.md` and `../mockups`. The request page always shows the current text and mockups, so edit the originals and never these. |
| `site/og.png` | 1200×630 link-preview image, rendered from `mockups/og-card.html`. |
| `mockups/*.html`, `mock.css` | Sources for the four mockup PNGs attached to the request. |
| `outreach/reddit-post.md` | Reddit post plus notes for r/github, HN, and social media. |
| `LAUNCH.md` | Launch checklist, step by step. |

## How to work on it

- **Preview the site:** `python3 -m http.server 8765 --directory site` (also set up in `.claude/launch.json` as `site`).
- **Re-render a mockup PNG** (2x) after editing its HTML. `$CHROME` is any Chrome or Chromium binary; set it in your own shell and never commit its value.
  ```bash
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 --window-size=1280,760 --screenshot="$PWD/mockups/1-comment-thread.png" "file://$PWD/mockups/1-comment-thread.html"
  ```
  Window heights used: 1→760, 2→730, 3→720, 4→710.
- **Re-render the OG image** (1x, 1200×630) from `mockups/og-card.html` into `site/og.png`.

## Working agreements

- **Nothing goes out without Matt.** Claude never posts, deploys, files, or pushes anything external. Matt posts the request and the Reddit post personally, by hand. A proposal about labeling agent posts loses credibility if an agent posts it.
- **Facts get checked before they're cited.** Any link or claim that will appear under Matt's name is looked up first.
- **Iteration mode (since 2026-11-06):** Matt is iterating. Don't end turns with "what's next / ready to launch?" questions until Matt says they're ready.
- **Commit proactively.** After each meaningful change (a finished edit, a re-rendered asset, a decision applied), commit it without being asked. Keep each commit to one change, with a short message that says what changed and why. Re-render any PNG whose HTML source changed before committing, so assets never fall behind their sources. Local commits only. Never push or add a remote unless Matt asks.
- **Commits are GPG-signed.** Signing is on in this repo's local git config. Never use `--no-gpg-sign`, and don't change the signing settings. If signing fails, stop and tell Matt instead of committing unsigned.
- **Keep this file current.** Update CLAUDE.md in the same commit as the change it describes: check off Progress items, move the "← current" marker, add a dated Log line for decisions and findings, update "Placeholders still to fill" and "The proposal (settled decisions)" when they change, and remove anything that's no longer true. A new session should be able to read this file and pick up where the last one left off.
- Matt rewrites copy in their own voice. Treat the drafted text as a starting point, not final.

## Placeholders still to fill

- `mweber` handle and `acme/http-client` repo in the mockups and demo (decide whether to use the real handle).
- In `site/index.html`: `REQUEST_URL`, `AUTHOR_URL`, `AUTHOR_NAME`, and an absolute `og:image` URL.
- In `site/request.html`: `REQUEST_URL` (keep it the same as in index.html) and an absolute `og:image` URL.
- `SITE_URL` in `request/feature-request.md`; `SITE_URL` and `REQUEST_URL` in `outreach/reddit-post.md`.

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
