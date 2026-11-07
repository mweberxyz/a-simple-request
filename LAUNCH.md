# Launch checklist

The site and the GitHub discussion need to link to each other, so the order matters. Plan for about 30 minutes, then stay around for the first hour or two to answer comments.

**Post all of this yourself, by hand.** A request about labeling agent posts loses credibility if an agent posts it.

## 0. Before launch day
- [ ] Read through `request/feature-request.md`, `outreach/reddit-post.md`, and the site, and rewrite anything that doesn't sound like you.
- [ ] Choose where the site lives. GitHub Pages fits the topic: a repo such as `agent-tag` whose root contains the files in `site/`. A subdomain of your own site also works.
- [ ] Read the r/ClaudeAI rules on self-promotion and post flair.
- [ ] **Check for duplicates.** Search the GitHub changelog (github.blog/changelog) and community discussions for "agent", "on behalf of", and "AI attribution". If something has shipped, rethink the request. If a matching discussion already exists, support and link that one instead of filing a new one; the site and Reddit post just point to its URL.
- [ ] Know that linking the five example issues/PRs (and the "Allow to mute bots" discussion) from a GitHub discussion adds a "mentioned this" reference on each of them, so their maintainers and participants will see it. That's probably welcome, but it is visible to them.

## 1. Deploy the site with placeholders
- [ ] Change `<meta property="og:image" content="og.png">` to the full URL, e.g. `https://you.github.io/agent-tag/og.png`. Link-preview scrapers need an absolute URL.
- [ ] Deploy. Write down the site URL (**SITE_URL**).

## 2. File the feature request
- [ ] Go to github.com/orgs/community/discussions → New discussion. Category: **💭 Other Feature Feedback, Questions, & Ideas** (under "Questions & Other Feedback"). The ask spans issues, PRs, reviews, and the API, so no single product category owns it, and similar cross-cutting requests live there. If the form asks for a feedback type, choose **Product Feedback**.
  - Avoid: *Apps, API and Webhooks* (frames it as an API feature), *Copilot Conversations* (reads as Copilot feedback; the request is vendor-neutral), *Repositories*, *Projects and Issues* (each covers only part of the problem).
- [ ] Paste `request/feature-request.md`, delete the HTML comment at the top, and add a link to the site at the end.
- [ ] Post it. Write down the discussion URL (**REQUEST_URL**).
- [ ] Reply in the pinned discussion "Which maintainer improvements would help you most?" (same category, started by GitHub staff) with a short note in your own words linking to the request. Don't paste the request there.

## 3. Connect the site to the request
- [ ] Set `REQUEST_URL` in `site/index.html`. Redeploy.
- [ ] Open the live site and click both "Add your 👍" buttons to confirm they open the discussion.
- [ ] Paste SITE_URL into a link-preview checker to confirm the image and title appear.

## 4. Go public
- [ ] Post to r/ClaudeAI using `outreach/reddit-post.md` (replace both URLs).
- [ ] Optional: r/github, HN, and social accounts, per the notes in `outreach/reddit-post.md`.
- [ ] Reply to early comments on Reddit and on the GitHub discussion. Thoughtful replies in the first hour do more than anything else.
