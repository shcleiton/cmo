---
name: ig-viral
description: >-
  Go and find the reels that are actually working right now in the user's
  niche, rank them by how far each beat its own account, name the hook formula
  each one used, and turn that into a swipe file they can shoot from. Use when
  the user says "find viral videos", "what's working right now", "what are
  people posting in my niche", "reverse engineer this account", "build me a
  swipe file", "why is this reel doing numbers", or asks what to make next and
  has no evidence to answer with.
---

# ig-viral

The research skill. Everything else in this pack writes; this one goes and
looks. Run it monthly, not daily. Formulas last a season.

One tool lives in this folder and it runs:

```bash
python3 swipe.py captured.tsv --out ~/.claude/instagram/swipe.md
```

## The one idea that makes this worth doing

**Raw views are not evidence.** An account with two million followers doing
400,000 views had a quiet Tuesday. An account with four thousand followers
doing 400,000 views found something, and that something is copyable.

So everything here ranks on the **outlier multiple**: views divided by that
account's own recent median. Anything above 3x is a signal. Anything below 1.5x
is that account's normal day and it teaches you nothing, no matter how big the
number looks.

Collect accounts **within about 10x of the user's own size**. A formula that
works at 2M followers often works because it is at 2M followers.

## Step 1: pick the accounts

Ask the user for 6 to 12 accounts, or propose them and get approval:

- **4 direct** - same niche, same offer, slightly ahead.
- **4 adjacent** - different niche, same audience. This is where formats get
  borrowed from before anybody in the niche has them.
- **2 to 4 outsized** - much bigger accounts, for format only, never for
  cadence or tone.

Also ask them to open their own **Saved collection**. It is the fastest and
most relevant corpus that exists and it is already filtered by their taste.

## Step 2: go and look

Two routes. **Apify is the default** when the session has the Apify MCP
(`mcp__apify__*`): it reads public data from Apify's own servers, with no
login, so the user's Instagram account is never involved. Fall back to
reading by hand (an in-app browser, a browser extension connected to the
user's own Chrome, or a computer-use tool) when Apify is not connected.

**Rules that are not negotiable:**

- **Never log into Instagram on the user's behalf and never ask for a
  password.** Not in a browser, not in an Apify actor that takes cookies or a
  session. Public data only.
- **Bounded runs, never a loop.** One research round at a time, run when the
  user asks. Do not schedule it, do not leave it running in the background,
  and cap every run with `callOptions.maxTotalChargeUsd`. Check the budget
  before and after at `https://api.apify.com/v2/users/me/limits` (read it as
  an MCP resource of the `apify` server).
- **Copy the formula, never the video.** The hook shape, the structure, the
  length, the pattern of cuts. Not their script, not their voice, not their
  edit. Attribute every row in the swipe file to the account it came from.

### The Apify route

Three actors cover it. Read each one's input schema with
`fetch-actor-details` before the first call of a session.

| job | actor | input that matters |
| --- | --- | --- |
| find candidates by topic | `data-slayer/instagram-search-reels` | `query` (one keyword in Portuguese), `maxPages: 4` |
| last N reels of each account | `apify/instagram-reel-scraper` | `username: [...]` (up to ~25 per run), `resultsLimit: 20` |
| followers, and finding a handle | `apify/instagram-scraper` | `directUrls` + `resultsType: "details"`, or `search` + `searchType: "user"` |

The order that worked: keyword search to find accounts that crossed the bar,
then the reel scraper on the candidates plus the user's own list to get each
median, then one details run for followers. 78 accounts and ~1,400 reels cost
about US$4.

Things that went wrong the first time, so they do not again:

- **Use `videoPlayCount` from the reel scraper as the view count.** The
  search actor's `play_count` adds Facebook plays and inflates the number (one
  reel read 1.2M in search and 918K on Instagram).
- **Group reel-scraper rows by `inputUrl`, not `ownerUsername`.** Collabs
  show up on the account's grid with someone else as owner.
- **Do not guess handles.** Half the guesses failed (`icarodecarvalho` is
  `icarode.carvalho`, `ericorocha` is `rochaerico`). An empty result means a
  wrong handle more often than a private account. Resolve with a user search.
- **Never pull captions into the conversation.** Ask `get-dataset-items` for
  only the fields you need. A large result is saved to a file; copy it to the
  scratchpad and parse it with Python.
- **The free plan runs 5 actors at once.** A sixth call fails; wait for one
  to finish.
- **The caption is not the hook.** The reel scraper's `includeTranscript`
  add-on (charged per minute of audio) gives the spoken first line when the
  analysis needs it.

### Reading the numbers

- **Median:** the last 20 reels, pinned ones excluded. When those 20 cover
  only a day or two (accounts posting several times a day), the median is
  not a baseline. Say so instead of ranking on it.
- **Recurrent or one-off.** Two or more reels above the bar in the last 20,
  or a median above 100K, is an account that does it on purpose. One spike
  over a low median is a one-off.
- **Probable paid boost.** Under 10K followers, a median under 1,000 views
  and one reel in the millions is the shape of a reel run as an ad. So is a
  like rate far below the account's own. Public data cannot prove it: flag it
  and point the user to the Meta Ad Library. Keep these out of the formulas
  to copy, since the distribution was bought.

**What to capture per reel**, in the creator's own words:

| field | notes |
| --- | --- |
| account | handle |
| followers | from the profile |
| median | eyeball the last 12 reels and take the middle view count |
| views | this reel |
| hook | the first line, spoken or on screen, verbatim including bad grammar |
| on-screen | the first text card, if different |
| length | seconds |
| cta | what they asked for at the end |

Median is the important one. Without it you are back to ranking by follower
count, which is the thing this skill exists to stop.

**When Instagram will not show you enough:** the same hook grammar runs on
YouTube Shorts, where view counts and transcripts are public and no login is
involved. It is a legitimate second corpus, and the spoken hook is easier to
get:

```bash
# view counts for a channel's shorts
python3 -m yt_dlp --flat-playlist --playlist-end 40 -J \
  "https://www.youtube.com/@HANDLE/shorts" > channel.json

# the spoken first line of one short, from its auto-captions
python3 -m yt_dlp --skip-download --write-auto-subs --sub-langs "en.*" \
  --sub-format json3 -o hook "https://www.youtube.com/watch?v=VIDEO_ID"
```

Take every caption word with a timestamp under 3.0 seconds. That is the hook,
as said, not as written.

## Step 3: rank it

Fill a tab-separated file with a header row and run the script:

```
account	followers	median	views	hook
@someone	48000	11000	412000	nobody tells you your first 30 reels are supposed to flop
```

```bash
python3 swipe.py captured.tsv --out ~/.claude/instagram/swipe.md
```

It computes the outlier multiple, names the hook formula using the same 26
formulas `/ig-reel` writes from, scores each hook with `hookscore.py`, and
prints what separates the top third from the bottom third.

## Step 4: say what it means, carefully

Report three things and no more:

1. **Which formulas over-index** in the top third, with counts. Two formulas
   appearing four times each across six accounts is a finding. One appearing
   twice is not.
2. **What the top third have in common structurally** that the bottom third do
   not: hook length, whether the payoff is visual, whether the first frame
   moves, where the ask is.
3. **The unclassified rows.** Every hook the classifier could not name is
   either noise or a formula that is not in `hooks.json` yet. Read them by
   hand. This is the most valuable column in the output and it is the reason
   the script prints the count.

Then state the sample size and the confidence in plain words. Forty reels
across six accounts supports a claim. Twelve does not, and saying so is the
difference between research and horoscopes.

## Step 5: turn it into something to shoot

For the top three formulas, write **the user's version**: their own story,
their own number, in the shape that is working. Hand each one to `/ig-reel`
with the formula id already chosen.

Never hand back "make a reel like this one". Hand back a hook line they could
say tomorrow.

## Output

```
SWIPE  ·  38 reels  ·  7 accounts  ·  baseline: account median

OUTLIERS (above 3x)
  38.4x  hook 86  #3  Nobody Tells You   @acct_a    412,000  (median 10,700)
  11.2x  hook 79  #9  The Steal          @acct_c    180,000  (median 16,100)
  ...

WHAT IS OVER-INDEXING
  #3 Nobody Tells You   x5 in the top third, 0 in the bottom
  #2 Negative Command   x4
  median hook length    8 words up top, 19 at the bottom

UNCLASSIFIED (6)
  Two of these are the same shape and it is not in hooks.json: a hook that
  opens on someone else's comment read out loud. Worth adding.

YOUR VERSION
  #3  "Nobody tells you the first 20 proposals are supposed to lose."
  ...
```

Write the swipe file to `~/.claude/instagram/swipe.md`. `/ig-reel` and
`/ig-plan` both read it, which is the point: after this runs once, the rest of
the pack is working from the user's own evidence instead of from defaults.

Nothing is posted, followed, liked or messaged by this skill. It reads.
