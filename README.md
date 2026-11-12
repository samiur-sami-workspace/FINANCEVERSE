# FINANCEVERSE v1.1 — Financial Decision Lab

FINANCEVERSE is an interactive, browser-based finance learning and simulation platform. Practice investing, portfolio management, capital budgeting, NPV, IRR, WACC, DCF valuation, financial ratios, and CFO-level financing decisions through fictional-market simulations and gamified missions.

## Features
- Professional responsive dashboard and account login UI
- Supabase email/password registration, sign-in, sign-out, and password reset
- Per-user cloud persistence for simulation progress
- Guest demo workspace with browser-local progress
- Virtual stock market, portfolio and transaction history
- NPV, IRR, profitability index, payback, WACC and DCF tools
- CFO financing simulator, financial ratios, XP, levels and missions

## Tech stack
- Static HTML, CSS and JavaScript
- Chart.js for charts
- Supabase Auth and Postgres (RLS-protected game state)
- Vercel for hosting and GitHub for source control

## Supabase configuration
The browser configuration is in `config.js`. It contains the Supabase project URL and a browser-safe publishable key only. **Never put a Supabase service-role key, database password, SMTP credential, or other secret in client-side code.**

The `public.game_states` table uses Row Level Security so authenticated users can read, insert, and update only their own row. The project has already been provisioned with this table and RLS policies. `schema.sql` is included as a reference/setup script for a fresh project; review it before running it against an existing database.

In Supabase Dashboard → Authentication → URL Configuration, set the Site URL and Redirect URLs to the production Vercel domain. Confirm email delivery, then test account registration, email confirmation, login, password reset, logout, and cloud save/load.

## Deploy on Vercel
This is a static site. Import this GitHub repository into Vercel, set the project root to the repository root, and leave the build command empty. The included `vercel.json` enables clean URLs. Connect the repository's production branch to enable automatic deployments on every push.

## Educational and security notes
- All securities and market prices are fictional; no broker, bank, payment service, or live exchange is connected.
- This is an educational simulator, not investment, tax, or legal advice.
- Client-side calculations are for learning and are not authoritative financial advice.
- For a larger production product, validate trading actions server-side and consider normalized transaction/holding tables, monitoring, backups, rate limits, privacy notice, terms, and account-deletion procedures.
