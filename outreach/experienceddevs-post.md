# r/ExperiencedDevs post

**Approach:** a discussion, not a launch. The post is about a problem engineers already have at work, across GitHub, Jira, Slack and the rest, and it asks how other teams handle it. The demo is linked once, in passing, as a GitHub-flavored illustration. The GitHub discussion isn't linked; share it in a comment only if someone asks where to follow along. No asks of any kind (votes, reactions, upvotes).

**Before posting:**
- Matt will rewrite this in his own words and ask Claude for feedback. This draft is the starting point.
- Read the sub's current rules and flair options. Claude couldn't open Reddit from here, so nothing below has been checked against them.
- If much of this wording survives, keep the disclosure line at the end.

**Title:** Should agents acting under our work accounts be able to say so?

**Body:**

Here's how I use Claude at work right now. Before it touches GitHub, Jira, or Slack, I have it tell me exactly what it's about to do: the comment it'll post, the ticket it'll update, the message it'll send. I read it, correct it, and only then let it go ahead.

That works. Nothing goes out under my name that I haven't read. But it makes me the blocker on everything, including work that could be fully automated: triaging a ticket, posting CI results, nudging a stale PR. I hold those back for one reason. Once they're posted, nobody can tell they came from an agent. They look exactly like something I wrote, and people respond to them as if I did.

That's the part I keep coming back to. When a colleague comments on my PR or my Jira ticket, I owe them a considered reply, because there's a person on the other end with feelings and context. When it's their agent, I might skim it, push back harder, or just fix the thing and move on. Right now I can't tell which I'm looking at. So I either give everything full human attention, or I risk being curt with a person because I assumed it was their agent.

What I'd want is boring: a standard way for an agent to mark what it does, shown next to the person's name, in every tool where it acts on someone's behalf. Not AI detection, and not a restriction. Just a way for well-behaved tools to be honest. If Jira showed me "this update came from Matt's agent", I'd know how much to trust it, what to verify, and whether I'm answering a human. And I could stop pre-approving the routine stuff, because the people reading it would know what it was.

The workarounds don't really fit work accounts. Footers and signature lines depend on every tool and every person remembering, and every team invents its own format. Approvals, merges, and status changes have no text to put a footer in. Separate bot accounts aren't an option when accounts come from SSO and every seat is a person.

I made a small mockup of what this could look like on GitHub, if it helps: https://mweberxyz.github.io/a-simple-request/

What I'm curious about:

- How does your team handle agent activity under people's own accounts? Are there written norms?
- Has anyone seen a disclosure convention actually stick across a team or org?
- Do you let agents approve, merge, or move tickets? If so, how do you keep track of what a human actually reviewed?
- Or is the right answer that anything under your name is yours, full stop, and how it got written doesn't matter?

*I drafted this with Claude's help and edited it myself.*
