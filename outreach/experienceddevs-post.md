# r/ExperiencedDevs post

**Approach:** a discussion, not a launch. The post is about a problem engineers already have at work, across GitHub, Jira, Slack and the rest, and it asks how other teams handle it. The demo is linked once, in passing, as a GitHub-flavored illustration. The GitHub discussion isn't linked; share it in a comment only if someone asks where to follow along. No asks of any kind (votes, reactions, upvotes).

**Before posting:**
- The sub only allows AI discussion on Wednesdays and Saturdays.
- Matt has re-written the post in his own words and approved the final result.
- Matt checked the sub's rules. Claude couldn't open Reddit from here.
- No disclosure line: the ideas are Matt's, and he reviewed all of it.

**Title:** How is your team separating the agent from the human?

**Body:**

TLDR: It's a mistake to let agents impersonate us.

At work, it's not obvious who-or-what I'm interacting with. Some of my teammates have review automations, and others have auto fix. As a result, there's a lot of churn going on for reasons no human considered or agreed to - sometimes an automated review suggestion is technically valid, but not worth doubling the scope of the PR to correct. AI attribution footers help, but they don't tell me to what degree my teammate is applying oversight to actions taken by their agent. Admittedly, this is as much of a social and team culture issue as a technical concern.

Personally, I am very cautious. I like to think my name next to a comment or an approval means something, and I think it's a mistake to let my agent represent me without oversight. I've spent a decade building rapport and trust with my peers, so I instruct my agent to show me what it will do as me before it does it. Then I read it, correct mistakes, and remove concerns I don't agree with. It works. But it makes my attention a blocker.

When a colleague comments on a PR or Jira ticket, I strive to be considerate and provide a thoughtful reply. When I can tell it was an un-reviewed, autonomous message, my standards change. I might skim it, push back harder, or just fix the thing and move on. When I can’t tell, I have to either give everything my full human attention, or risk being curt with a person because I assumed it was their agent - in both cases, my reply hits the human's notifications.

What I imagine as the direction we as an industry should move: a platform-integrated mechanism for a well-behaved agent to flag what it does, shown next to the human's name, in tools where an agent acts on a human's behalf. This goes beyond comments - there are some circumstances where I want my agent to make a decision (like approving a trivial PR), and that shouldn't hold as much weight as my human approval, and some actions don't have an accompanying place to leave context.

I was screwing around last night and built a demo for the GitHub case to illustrate, if anyone is interested: https://mweberxyz.github.io/a-simple-request/

Does anyone else even care?

-

PS: I also have ... feelings ... about anthropomorphization of an algorithm. Where I say "agent", you can fill in "Claude", "AI", or "the harness", or even "him" (cringe personally, no judgement though) if that helps. This is probably a discussion for a different Saturday.
