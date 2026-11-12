-- FINANCEVERSE cloud persistence schema
-- Each authenticated user owns exactly one simulation-state row.
create table if not exists public.game_states (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.game_states enable row level security;

drop policy if exists "Users can read own game state" on public.game_states;
create policy "Users can read own game state"
  on public.game_states for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own game state" on public.game_states;
create policy "Users can insert own game state"
  on public.game_states for insert to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own game state" on public.game_states;
create policy "Users can update own game state"
  on public.game_states for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

grant select, insert, update on public.game_states to authenticated;
