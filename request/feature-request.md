<!--
  Where: github.com/orgs/community/discussions → New discussion.
  Category: "💭 Other Feature Feedback, Questions, & Ideas". Feedback type, if asked: "Product Feedback".
  Then reply briefly in the pinned "Which maintainer improvements would help you most?" discussion, linking here (see LAUNCH.md step 2).
  After the site launches, add a link to it at the end.
-->

# Allow well-behaved agents to self identify

More and more of what's posted under my name on GitHub comes from an agent using my token, and it looks exactly like something I wrote. Nobody reading it can tell the difference.

I'd like a standard way for an agent to say "an agent did this," and a marker next to the author's name when it does. This is for agents that want to behave well. It isn't detection, and it doesn't change what an agent is allowed to do.

Projects are already inventing their own markers: [drivecore/mycoder#368](https://github.com/drivecore/mycoder/issues/368), [kornia/kornia#6223](https://github.com/kornia/kornia/pull/6223), [humlab-speech/visible-speech-deployment#259](https://github.com/humlab-speech/visible-speech-deployment/pull/259), [Adam-S-Daniel/_agent-guidance#319](https://github.com/Adam-S-Daniel/_agent-guidance/issues/319), [noahdgrant/nightshift#682](https://github.com/noahdgrant/nightshift/issues/682). Each uses its own format, and none can mark actions that have no text, like approvals, merges, and closes.

Possible implementations:

- A request header that agents send on every API call
- A setting on the token, chosen when it's created

What comes next:

- Muting or filtering agents, the way [Allow to mute bots](https://github.com/orgs/community/discussions/5793) asks for bots
- Letting the person mark an agent's post as reviewed

---
*I drafted this with an AI agent and reviewed every line before posting.*
