# Opus 4.7 Trading Bot

An autonomous swing-trading agent that runs on Claude Code. Claude reads its own
memory files, pulls live account state from Alpaca, does research via Perplexity,
places real orders (paper account by default), and notifies via ClickUp. There is
no separate bot process — every run is a fresh Claude Code invocation. All state
lives in `memory/*.md`, committed to git.

## Two execution modes

- **Local**: run the slash commands in `.claude/commands/` manually
  (`/portfolio`, `/trade`, `/pre-market`, `/market-open`, `/midday`,
  `/daily-summary`, `/weekly-review`). Credentials come from the local `.env`.
- **Cloud routines**: the prompts in `routines/*.md` are meant to be pasted
  verbatim into Claude Code cloud Routines, one per workflow, on a cron
  schedule. Credentials there come from the routine's environment config, not
  a `.env` file. See `routines/README.md`.

## First-time setup

1. `cp env.template .env` and fill in your real Alpaca / Perplexity / ClickUp
   keys. `ALPACA_ENDPOINT` defaults to the **paper** trading URL — leave it
   there until you've validated the system.
2. Run `/portfolio` in Claude Code. You should see account equity, cash, and
   positions print cleanly with no errors.
3. Read `memory/TRADING-STRATEGY.md` — the rulebook every workflow enforces
   before it will place a trade.
4. When ready for scheduled runs, either configure the five Claude Code cloud
   Routines per `routines/README.md`, or wire up cron another way that invokes
   the corresponding `.claude/commands/*.md` prompt against this repo.

## Rules this bot will never break

- No options — stocks only.
- Max 5-6 open positions, 20% of equity each, 3 new trades/week.
- Every position gets a real 10% trailing stop (GTC order), tightened as it
  gains, never loosened.
- Losers get cut at -7%, no averaging down.

Full detail in `memory/TRADING-STRATEGY.md`.
