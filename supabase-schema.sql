-- M-TAKSI — Supabase sxemasi
-- Buni Supabase loyihangizda: SQL Editor > New query ga joylashtirib RUN qiling.

create extension if not exists "pgcrypto";

create table if not exists drivers (
  id          uuid primary key default gen_random_uuid(),
  name        text not null default '',
  plate       text not null default '',
  route       text not null default '',
  status      text not null default 'offline'
              check (status in ('ichkarida','yolda','bekatda','offline')),
  phone       text not null default '',
  login       text not null default '',
  pass        text not null default '',
  hours       text not null default 'Belgilanmagan',
  telegram    boolean not null default false,
  payment     text not null default 'qarzdor'
              check (payment in ('toʻlangan','qarzdor')),
  created_at  timestamptz not null default now()
);

-- Xavfsizlikni yoqamiz: faqat tizimga kirgan (authenticated) foydalanuvchi
-- (ya'ni admin) haydovchilar jadvalini o'qishi/o'zgartirishi mumkin.
alter table drivers enable row level security;

create policy "admin_select_drivers" on drivers
  for select using (auth.role() = 'authenticated');

create policy "admin_insert_drivers" on drivers
  for insert with check (auth.role() = 'authenticated');

create policy "admin_update_drivers" on drivers
  for update using (auth.role() = 'authenticated');

create policy "admin_delete_drivers" on drivers
  for delete using (auth.role() = 'authenticated');
