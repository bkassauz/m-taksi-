# M-taksi — onlaynga chiqarish yoʻriqnomasi

Uch bosqich: **Supabase** (baza) → **GitHub** (kod) → **Vercel** (onlayn sayt).

---

## 1-BOSQICH: Supabase

1. https://supabase.com ga kiring → **New project**.
   - Ism: `m-taksi` (yoki xohlagan nom)
   - Parol: bazaga kirish uchun kuchli parol qo'ying (buni admin login/parolingiz bilan aralashtirmang — bu boshqa narsa)
   - Region: eng yaqinini tanlang, masalan `Europe (Frankfurt)`
   - **Create new project** — 1-2 daqiqa kutadi.

2. Chap menyudan **SQL Editor** ga o'ting → **New query**.
   - `supabase-schema.sql` faylining butun matnini nusxalab shu yerga joylashtiring.
   - **Run** tugmasini bosing. "Success" deb chiqishi kerak — bu `drivers` jadvalini yaratadi.

3. Chap menyudan **Authentication → Users** ga o'ting → **Add user** → **Create new user**.
   - Email: `imradjabov@mtaksi.local`
   - Password: `zdrrgb12`
   - "Auto Confirm User" belgisini albatta yoqing (yoqilmasa kira olmaysiz).
   - **Create user**.
   - (Bu — sizning admin hisobingiz. Saytda "Login" oynasiga shunchaki `imradjabov` deb yozasiz, kod avtomatik shu emailga aylantiradi.)

4. Chap menyudan **Project Settings → API** ga o'ting. Ikkita qiymatni nusxalab oling:
   - **Project URL** (masalan `https://abcxyz.supabase.co`)
   - **anon public** kaliti (uzun matn)

5. `index.html` faylini oching, eng yuqoridagi qismni toping:
   ```js
   const SUPABASE_URL = 'YOUR_SUPABASE_URL';
   const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
   ```
   Ikkalasini ham 4-qadamda olgan qiymatlaringiz bilan almashtiring va faylni saqlang.

---

## 2-BOSQICH: GitHub

1. https://github.com → **New repository** → nom: `m-taksi` → **Create repository**.

2. Eng oson yo'l — brauzer orqali:
   - Repo sahifasida **Add file → Upload files**.
   - `index.html` va boshqa fayllarni (agar bo'lsa) shu yerga tashlang.
   - Pastda **Commit changes** tugmasini bosing.

   (Agar kompyuteringizda `git` o'rnatilgan bo'lsa, buning o'rniga terminalda:)
   ```bash
   git init
   git add .
   git commit -m "M-taksi birinchi versiya"
   git branch -M main
   git remote add origin https://github.com/USERNAME/m-taksi.git
   git push -u origin main
   ```

---

## 3-BOSQICH: Vercel

1. https://vercel.com → GitHub hisobingiz bilan kiring.
2. **Add New → Project**.
3. Roʻyxatdan `m-taksi` repositoriyangizni tanlang → **Import**.
4. Framework Preset: **Other** (build sozlamalari kerak emas, chunki bu oddiy statik sayt).
5. **Deploy** tugmasini bosing — bir necha soniyada tayyor bo'ladi.
6. Vercel sizga `https://m-taksi-xxxx.vercel.app` kabi havola beradi — sayt shu yerda jonli ishlaydi.

Keyingi safar `index.html` faylini o'zgartirib GitHub'ga qayta yuklasangiz (yoki `git push` qilsangiz), Vercel avtomatik ravishda saytni yangilaydi.

---

## Eslatma

- Hozircha faqat **Haydovchilar** bo'limi Supabase bilan bog'langan (ro'yxat, qo'shish, tahrirlash — hammasi endi haqiqiy bazada saqlanadi).
- **Yo'lovchilar**, **Xarita sozlamalari**, **To'lov tizimi**, **Analitika**, **Qo'llab-quvvatlash markazi**, **Sozlamalar** — hali placeholder holatida, keyingi bosqichlarda ular ham ulanadi.
- Admin login/parolni Supabase **Authentication → Users** bo'limidan istalgan vaqt o'zgartirishingiz mumkin.
