<!--
  Where: github.com/orgs/community/discussions → New discussion.
  Category: "💭 Other Feature Feedback, Questions, & Ideas". Feedback type, if asked: "Product Feedback".
  Then reply briefly in the pinned "Which maintainer improvements would help you most?" discussion, linking here (see LAUNCH.md step 2).
  After the site launches, add a link to it at the end.
-->

# Allow well-behaved agents to self identify

More and more of what's posted under a developer's name on GitHub comes from an agent using that developer's credentials. Some of it was reviewed by the person, and some of it wasn't. Today nobody reading it can tell which is which, including the person whose name is on it.

## The problem

A name on GitHub means something because peers learned it means *"this person thought about this."* When an agent posts with my token, it looks exactly like me:

- **My name gets spent without me seeing it.** An unreviewed agent comment uses up the trust my name carries.
- **The only safe option is reviewing everything,** which takes away most of the value of delegating.
- **Readers start suspecting everything.** Maintainers can't tell which comments a person actually looked at, so they trust all of them less.

The useful distinction isn't *"a machine typed this."* It's *"the person named here has or hasn't looked at this."*

Bot accounts don't fit: they cut the link to the responsible person and need their own seat and permissions. `Co-authored-by` trailers only cover commits.

## People are already working around this

Projects are inventing their own markers, one at a time:

- **drivecore/mycoder#368**: the agent uses the maintainer's PAT, so *"it can appear that I am talking to myself."* https://github.com/drivecore/mycoder/issues/368
- **kornia/kornia#6223**: agents must end every PR, issue, comment, and review with *"Posted on behalf of @handle by Agent (model)."* https://github.com/kornia/kornia/pull/6223
- **humlab-speech/visible-speech-deployment#259**: requires an "AI-generated" footer on anything an agent posts. https://github.com/humlab-speech/visible-speech-deployment/pull/259
- **Adam-S-Daniel/_agent-guidance#319**: a footer, a label, and a commit trailer, enforced by a hook. Merges, label changes, closes, and approvals still show up as the owner with no marker. https://github.com/Adam-S-Daniel/_agent-guidance/issues/319
- **noahdgrant/nightshift#682**: moving agents to a separate GitHub identity, which gives up the link to the person. https://github.com/noahdgrant/nightshift/issues/682

Each project picks its own format, and none of them can mark actions that have no text: approvals, merges, label changes, closes.

## The ask

Give agents a standard way to identify themselves when they act on GitHub, so that what an agent posted can be told apart from what the person reviewed.

This is for agents that want to behave well. It isn't detection, and it doesn't change what an agent is allowed to do.

## Possible implementations

- **A request header** that agents send on every API call, recorded with whatever the request creates.
- **A token setting**, chosen when the credential is created, that marks everything made with it.

---
*I drafted this request with an AI agent, then reviewed every line before posting.*
