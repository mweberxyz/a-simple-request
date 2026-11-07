# A simple request to GitHub

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
| `site/og.png` | 1200×630 link-preview image, rendered from `mockups/og-card.html`. |
| `mockups/*.html`, `mock.css` | Sources for the four mockup PNGs attached to the request. |
| `outreach/reddit-post.md` | Reddit post plus notes for r/github, HN, and social media. |
| `LAUNCH.md` | Launch checklist, step by step. |

## How to work on it

- **Preview the site:** `python3 -m http.server 8765 --directory site` (also set up in `.claude/launch.json` as `site`).
- **Re-render a mockup PNG** (2x) after editing its HTML:
  ```bash
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 --window-size=1280,760 --screenshot="$PWD/mockups/1-comment-thread.png" "file://$PWD/mockups/1-comment-thread.html"
  ```
  Window heights used: 1→760, 2→730, 3→720, 4→710.
- **Re-render the OG image** (1x, 1200×630) from `mockups/og-card.html` into `site/og.png`.

## Working agreements

- **Nothing goes out without Matt.** Claude never posts, deploys, files, or pushes anything external. Matt posts the request and the Reddit post personally, by hand. A proposal about labeling agent posts loses credibility if an agent posts it.
- **Facts get checked before they're cited.** Any link or claim that will appear under Matt's name is looked up first.
- **Iteration mode (since 2026-11-06):** Matt is iterating. Don't end turns with "what's next / ready to launch?" questions until Matt says they're ready.
- Matt rewrites copy in his own voice. Treat the drafted text as a starting point, not final.

## Placeholders still to fill

- `mweber` handle and `acme/http-client` repo in the mockups and demo (decide whether to use the real handle).
- In `site/index.html`: `REQUEST_URL`, `AUTHOR_URL`, `AUTHOR_NAME`, and an absolute `og:image` URL.
- `SITE_URL` in `request/feature-request.md`; `SITE_URL` and `REQUEST_URL` in `outreach/reddit-post.md`.

## Progress

- [x] Vision discussed and refined. The line that matters is "reviewed vs. not," not "human vs. machine."
- [x] Mockups 1–4 (comment tag, token settings, PR endorse/filter, tag styles).
- [x] Feature request draft, with evidence section.
- [x] Interactive demo site plus OG image, checked on desktop, mobile, and dark mode.
- [x] Reddit post draft and launch checklist.
- [x] Moved into this repo (2026-11-06).
- [ ] Iterate on content and design with Matt. ← **current**
- [ ] Duplicate check: GitHub changelog plus community discussions.
- [ ] Decide on hosting. GitHub Pages serves from the repo root or `/docs` only, not `/site`, so either move the folder or use a Pages workflow.
- [ ] Fill placeholders, then launch per `LAUNCH.md`.

## Log

- **2026-11-06:** Initial mockups, site, request, outreach drafts. A side session researched prior art and the five workaround repos were verified and added.
