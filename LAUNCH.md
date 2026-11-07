# Launch checklist

The site and the GitHub discussion need to link to each other, so the order matters. Plan for about 30 minutes, then stay around for the first hour or two to answer comments.

**Post all of this yourself, by hand.** A request about labeling agent posts loses credibility if an agent posts it.

## 0. Before launch day
- [ ] Read through `request/feature-request.md`, `outreach/reddit-post.md`, and the site, and rewrite anything that doesn't sound like you.
- [x] Where the site lives: **GitHub Pages**, served from `docs/` in this repo, at https://mweberxyz.github.io/a-simple-request/ (assumes the repo is named `a-simple-request`; if not, change `og:image` and `og:url` in `docs/index.html`).
- [ ] Read the r/ClaudeAI rules on self-promotion and post flair.
- [ ] **Check for duplicates.** Search the GitHub changelog (github.blog/changelog) and community discussions for "agent", "on behalf of", and "AI attribution". If something has shipped, rethink the request. If a matching discussion already exists, support and link that one instead of filing a new one; the site and Reddit post just point to its URL.
- [ ] Know that linking the five example issues/PRs (and the "Allow to mute bots" and "First-class agent identities" discussions) from a GitHub discussion adds a "mentioned this" reference on each of them, so their maintainers and participants will see it. That's probably welcome, but it is visible to them.

## 1. Deploy the site with placeholders
- [ ] On GitHub, create a **public** repo named `a-simple-request` (Pages on a free account needs it public). Making it public publishes everything in it, including these drafts, so do this on launch day.
- [ ] Push `main` (commands are in CLAUDE.md under "Deploying").
- [ ] Repo Settings → Pages → Build and deployment: **Deploy from a branch**, branch `main`, folder **/docs**. Save, and wait a minute for the first deploy.
- [ ] Open https://mweberxyz.github.io/a-simple-request/ and play the demo once. That URL is **SITE_URL**.

## 2. File the feature request
- [ ] Go to github.com/orgs/community/discussions → New discussion. Category: **💭 Other Feature Feedback, Questions, & Ideas** (under "Questions & Other Feedback"). The ask spans issues, PRs, reviews, and the API, so no single product category owns it, and similar cross-cutting requests live there. If the form asks for a feedback type, choose **Product Feedback**.
  - Avoid: *Apps, API and Webhooks* (frames it as an API feature), *Copilot Conversations* (reads as Copilot feedback; the request is vendor-neutral), *Repositories*, *Projects and Issues* (each covers only part of the problem).
- [ ] Paste `request/feature-request.md`, delete the HTML comment at the top, and add a link to the site at the end.
- [ ] Post it. Write down the discussion URL (**REQUEST_URL**).
- [ ] Reply in the pinned discussion "Which maintainer improvements would help you most?" (same category, started by GitHub staff) with a short note in your own words linking to the request. Don't paste the request there.

## 3. Connect the site to the request
- [ ] Set `REQUEST_URL` in `docs/index.html`, commit, and push. Pages redeploys on its own.
- [ ] Open the live site and click both "Add your 👍" buttons to confirm they open the discussion.
- [ ] Paste SITE_URL into a link-preview checker to confirm the image and title appear.

## 4. Go public
- [ ] Post to r/ClaudeAI using `outreach/reddit-post.md` (replace both URLs).
- [ ] Optional: r/github, HN, and social accounts, per the notes in `outreach/reddit-post.md`.
- [ ] Reply to early comments on Reddit and on the GitHub discussion. Thoughtful replies in the first hour do more than anything else.
