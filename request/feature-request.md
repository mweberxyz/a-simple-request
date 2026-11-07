<!--
  Where: github.com/orgs/community/discussions → New discussion.
  Check which category GitHub currently uses for product feedback before posting
  (it has been "General" / "Product Feedback"; pick the one that fits).
  Attach the four numbered PNGs from mockups/ by dragging them into the editor at the marked spots.
-->

# Agent attribution: mark content an agent posted for you, without your review

## Summary

Let users turn on **agent attribution** for a credential (PAT, OAuth grant, GitHub App user token, `gh` login). Anything created with that credential, such as comments, issues, PRs, reviews, and pushes, shows a small `agent` tag next to the user's name. The user can later **endorse** an item, which removes the tag. Readers and maintainers can filter on the tag.

This adds no new account type. The tag is a fact about the credential, stored next to the user's identity.

## The problem

More and more of what's posted under a developer's name on GitHub comes from agents acting with that developer's credentials. Some of it gets reviewed and some of it doesn't. Right now readers can't tell the two apart:

- **Reputation gets spent without the owner seeing it.** A developer's name is trusted because peers learned it means *"this person thought about this."* Unreviewed agent output uses up that trust without anyone noticing.
- **The only fix is reviewing everything,** which takes away most of the value of delegating.
- **Readers start suspecting everything.** Maintainers don't know which comments got a person's attention, so they trust all of them less. That's a large part of why AI activity on GitHub feels hostile right now.

The useful line isn't *"a machine typed this."* It's *"the person named here has or hasn't looked at this."*

## Proposal

### 1. Attribution belongs to the credential
When you create a PAT, authorize an OAuth app or GitHub App, or run `gh auth login`, you choose **Personal** (the default, same as today) or **Agent**. The choice is fixed when the credential is created. The client using it can't remove it. A label a client applies to itself is easy to skip. One tied to the credential is reliable.

Optionally, the user names the agent (for example "Claude Code" or "triage bot"), and the name appears as "via …".

<!-- attach 2-token-settings.png -->

### 2. An `agent` tag next to the user's name
Content created with agent attribution shows an `agent` tag beside the author's name, in the same family as the existing `bot` label. Hovering explains it: *"Posted by an agent on @user's behalf. @user hasn't reviewed this."* The account, the permissions, and the responsibility stay with the user.

<!-- attach 1-comment-thread.png -->

### 3. Endorse as mine
The user can review any agent-created item and **endorse** it. The tag is removed, and the timeline records "@user endorsed this." Endorsing is the cheap path to full authorship: review what matters and let the rest go out with an honest tag.

### 4. Filters for readers, and the API
- In a repo, readers can **show / collapse / hide** unreviewed agent activity. Maintainers can set the repo default.
- Notification filters can exclude unreviewed agent activity.
- REST/GraphQL expose the field, similar to the existing `performed_via_github_app`, e.g. `agent_attribution: { name, endorsed_by, endorsed_at }`.

<!-- attach 3-pull-request.png -->

### 5. How the tag looks
Options, from least to most effort:
- **A. Grey**, matching the `bot` label. No new design needed.
- **B. Purple with a glyph.** Easier to notice, readable without color, and screen readers announce it.
- **C. The user chooses.** The user picks a color from a fixed palette (no green, so it can't pass for "verified") and a short suffix (`agent · triage`). The glyph, the word "agent", and the shape never change.

<!-- attach 4-tag-styles.png -->

## Why existing mechanisms don't cover this

| Mechanism | What's missing |
|---|---|
| Bot / machine accounts | Breaks the link to the responsible person, and needs its own seat, permissions, and access management. |
| GitHub Apps on behalf of a user | Shows which app posted, not whether the user reviewed it. Doesn't cover PATs or `gh`. |
| `Co-authored-by` trailers | Commits only, honor system, and not shown on comments or reviews. |
| Built-in agent features | Only covers that vendor's agent. Agents from other vendors, and local ones, look exactly like the user. |

## People are already working around this

Projects are building their own versions of this one at a time:

- **drivecore/mycoder#368**: the agent uses the maintainer's PAT, so *"it can appear that I am talking to myself."* They want a footer added to everything it posts. https://github.com/drivecore/mycoder/issues/368
- **kornia/kornia#6223**: agents must end every PR, issue, comment, and review with *"Posted on behalf of @handle by Agent (model)."* https://github.com/kornia/kornia/pull/6223
- **humlab-speech/visible-speech-deployment#259**: requires an "AI-generated" footer on anything an agent posts. https://github.com/humlab-speech/visible-speech-deployment/pull/259
- **Adam-S-Daniel/_agent-guidance#319**: uses a footer, an `agent-authored` label, and a commit trailer, enforced by a hook. Merges, label changes, closes, and approvals still show as the owner with no marker. https://github.com/Adam-S-Daniel/_agent-guidance/issues/319
- **noahdgrant/nightshift#682**: is moving agents to a separate GitHub identity so a person's own words can be verified, which gives up the link to that person. https://github.com/noahdgrant/nightshift/issues/682

All of these rely on the honor system, each project invents its own format, and an agent can skip them. None of them can mark actions that have no text, such as approvals, merges, label changes, and closes. Only GitHub can attach the marker to the action itself.

## Non-goals

- **Detecting AI-written text.** This is declared provenance, not detection.
- **Shaming or limiting agent use.** Credentials with agent attribution keep the same permissions. The tag only says whether a person reviewed the content.
- **Enforcing honesty.** A user can still give an agent a Personal token. The goal is to make the honest path the easy and expected one, and the API field lets orgs require agent tokens for automation if they want to.

## Open questions

- **Commits:** tag commits pushed by an agent credential, mark a signing key as an agent key ("Verified · agent"), or both?
- **Bulk endorse** for a PR, or for everything an agent credential posted in a time range?
- Should orgs be able to **require** agent attribution on credentials used for automation?

---
*I drafted this request and the mockups with an AI agent, then reviewed every line before posting. That's the workflow this proposal is meant to make visible.*

Interactive demo: SITE_URL
