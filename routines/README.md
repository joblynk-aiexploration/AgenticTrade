# Cloud Routine Prompts

These five files are meant to be pasted **verbatim** into Claude Code cloud
Routines (Routines → New Routine), one routine per file. Do not paraphrase —
the environment-variable check block and the commit-and-push step are
load-bearing.

Each cloud routine run is an ephemeral container: it clones this repo at
`main`, injects the routine's configured environment variables (no `.env`
file exists in that context), runs the prompt, and is destroyed. If the
prompt doesn't `git commit` + `git push origin main` before exiting,
everything it did evaporates.

## One-time prerequisites (per the setup guide, Part 7)

1. Install the Claude GitHub App on this repo (or run `/web-setup`).
2. In each routine's environment settings, enable **"Allow unrestricted
   branch pushes"** — without it, `git push origin main` silently fails.
3. Set these as environment variables on each routine (not in a `.env` file):
   `ALPACA_API_KEY`, `ALPACA_SECRET_KEY`, `ALPACA_ENDPOINT`,
   `ALPACA_DATA_ENDPOINT`, `PERPLEXITY_API_KEY`, `PERPLEXITY_MODEL`,
   `CLICKUP_API_KEY`, `CLICKUP_LIST_ID`.

## Cron schedules (America/Chicago — adjust for your timezone)

| Routine | Cron | Meaning |
|---|---|---|
| pre-market.md | `0 6 * * 1-5` | 6:00 AM weekdays |
| market-open.md | `30 8 * * 1-5` | 8:30 AM weekdays |
| midday.md | `0 12 * * 1-5` | Noon weekdays |
| daily-summary.md | `0 15 * * 1-5` | 3:00 PM weekdays |
| weekly-review.md | `0 16 * * 5` | 4:00 PM Fridays only |

Click "Run now" once per routine after creating it to verify before waiting
for the next scheduled tick.

## Local testing instead

For ad-hoc or local testing, use the matching commands in
`.claude/commands/` (`/pre-market`, `/market-open`, `/midday`,
`/daily-summary`, `/weekly-review`) — these read the local `.env` instead of
routine-injected env vars, and do not auto-commit.
