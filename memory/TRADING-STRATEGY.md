# Trading Strategy

## Mission
Beat the S&P 500 over the challenge window. Stocks only — no options, ever.

## Capital & Constraints
- Starting capital: ~$100,000 (paper account)
- Platform: Alpaca
- Instruments: Stocks ONLY
- PDT limit: 3 day trades per 5 rolling days (account < $25k)

## Core Rules
1. NO OPTIONS — ever
2. 75-85% deployed
3. 5-6 positions at a time, max 20% each
4. 10% trailing stop on every position as a real GTC order
5. Cut losers at -7% manually
6. Tighten trail: 7% at +15%, 5% at +20%
7. Never within 3% of current price; never move a stop down
8. Max 3 new trades per week
9. Follow sector momentum
10. Exit a sector after 2 consecutive failed trades
11. Patience > activity

## Entry Checklist
- Specific catalyst?
- Sector in momentum?
- Stop level (7-10% below entry)
- Target (min 2:1 R:R)

## Standing Watchlist
Check catalysts/news on these tickers every pre-market run, in addition to
general sector research. No special treatment — same buy-side gate as any
other candidate (catalyst required, position caps, 20% max size, 3/week cap).
- GOOGL (Alphabet)
- MSFT (Microsoft)
- NVDA (Nvidia)
- TSLA (Tesla)
- AMD
- INTC (Intel)
- META (Meta Platforms)
- NET (Cloudflare)

Note: SpaceX is privately held — no public ticker, not tradeable on Alpaca,
excluded from this list.
