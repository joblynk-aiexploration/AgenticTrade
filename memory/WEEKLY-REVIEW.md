# Weekly Review

Friday reviews appended here.
Template for each entry:

## Week ending YYYY-MM-DD

### Stats
| Metric | Value |
|--------|-------|
| Starting portfolio | $X |
| Ending portfolio | $X |
| Week return | ±$X (±X%) |
| S&P 500 week | ±X% |
| Bot vs S&P | ±X% |
| Trades | N (W:X / L:Y / open:Z) |
| Win rate | X% |
| Best trade | SYM +X% |
| Worst trade | SYM -X% |
| Profit factor | X.XX |

### Closed Trades
| Ticker | Entry | Exit | P&L | Notes |

### Open Positions at Week End
| Ticker | Entry | Close | Unrealized | Stop |

### What Worked
- ...

### What Didn't Work
- ...

### Key Lessons
- ...

### Adjustments for Next Week
- ...

### Overall Grade: X

## Week ending 2026-07-24

### Stats
| Metric | Value |
|--------|-------|
| Starting portfolio | $100,000.12 |
| Ending portfolio | $100,000.10 |
| Week return | -$0.02 (~0.00%) |
| S&P 500 week | -0.66% (7,457.69 → 7,408.30) |
| Bot vs S&P | +0.66% (by holding cash) |
| Trades | 0 (W:0 / L:0 / open:0) |
| Win rate | N/A (no closed trades) |
| Best trade | N/A |
| Worst trade | N/A |
| Profit factor | N/A |

### Closed Trades
| Ticker | Entry | Exit | P&L | Notes |
| — | — | — | — | No trades executed this week |

### Open Positions at Week End
| Ticker | Entry | Close | Unrealized | Stop |
| — | — | — | — | — |

### What Worked
- Discipline: refused to force XOM entry into stale pre-market quote (7/22) and −0.4% futures tape (7/23)
- Correctly invalidated Energy/XOM thesis on 7/24 when Iran ceasefire narrative began collapsing the oil premium (Brent $71-78 vs prior $94+)
- Preserved all 3 day-trade slots and full buying power ahead of FOMC July 28-29
- Watchlist tech avoided during AI-capex reset (GOOGL -7%, TSLA -6% post-earnings drawdown)
- Beat S&P by ~66 bps by not being long a down tape

### What Didn't Work
- 0% deployment for entire week violates the 75-85% capital deployment target
- Never converted a valid catalyst (Energy sector leadership + oil geopolitics) into an intraday entry — no midday runs logged to validate live setup
- No LMT re-evaluation after pre-market print despite flagging it as a defense-catalyst candidate
- Buying-power reporting flipped between 1x cash and 4x margin across runs — no reconciliation logged
- Multiple pre-market runs produced same "HOLD" without a documented trigger that would move us to "TRADE"

### Key Lessons
- "Patience > activity" is a governor, not a shield — a week with zero deployment and a live sector catalyst is still a miss
- Data conflicts (WTI $88 vs $71 on same day) demand a tie-breaker rule, not another HOLD
- Pre-market runs need explicit "if X at open, execute" plans, not vague "await live confirmation" — otherwise the midday run inherits no decision
- Cash-outperforms-S&P-in-a-down-week is luck, not edge

### Adjustments for Next Week
- Post-FOMC (Wed 7/29): if VIX <20 and any watchlist name shows a clean 2:1 setup with sector alignment, execute at least one entry — target ending week at ≥20% deployed
- Pre-market runs must produce a hard trigger ("XOM > $146 with WTI > $85 at 9:45 = buy 15%") or an explicit "no trade all day" call
- On data conflicts across price feeds, default to the Alpaca live quote at cash open as tie-breaker, not Perplexity aggregation
- Add a midday-run entry to the log for every day, even a one-liner, so decisions don't fall through the gap between pre-market and EOD

### Overall Grade: C
Correct process on every individual pre-market call, but the net outcome (0 trades, 0% deployed) is not the strategy the mandate describes. Preservation is not performance — beating S&P requires being in the game.
