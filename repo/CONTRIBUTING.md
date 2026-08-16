# Panduan kontribusi

## Menyiapkan

```bash
git clone git@github.com:Constanvel/project.git
cd project
npm install
npm run dev
```

## Alur kerja

Kerjakan di branch terpisah, jangan langsung ke `main`.

```bash
git checkout -b nama-pekerjaan
# kerjakan
git commit -m "pesan yang menjelaskan apa yang berubah"
git push -u origin nama-pekerjaan
```

Lalu buka pull request. Satu PR sebaiknya menyelesaikan satu hal.

## Aturan desain

Seluruh nilai visual sudah ditetapkan di `docs/DESIGN.md`. Jangan mengarang
warna, ukuran, atau radius baru — kalau butuh sesuatu yang belum ada di sana,
tanyakan dulu.

Yang paling sering keliru:

- **Warna** ambil dari `tailwind.config.js`, contoh `bg-merah` bukan
  `bg-[#E81E28]`. Kelas `bg-[#...]` di `App.jsx` adalah sisa prototipe dan
  boleh diganti sambil jalan
- **Radius** tombol, input, dan chip selalu pill penuh
- **Fokus keyboard** memakai cincin merah, sudah diatur global di
  `src/index.css`. Jangan menulis `outline-none` tanpa menggantinya
- **Setiap kontrol** butuh status hover, pressed, dan nonaktif. Merah:
  `#E81E28` → `#C41A22` → `#A9161D`. Putih: putih → `#F5F5F5` → `#EDEDEF`
- **Toast** muncul di tengah bawah, bertahan 3 detik, hijau untuk berhasil dan
  merah untuk gagal
- **Overlay** wajib menutup lewat Esc, tombol X, dan klik di luar
- **Salinan teks** berbahasa Indonesia dan sudah final. Jangan menulis ulang
  tanpa alasan

## Aksi yang butuh akun

Bungkus dengan `requireAuth`:

```jsx
onClick={() => app.requireAuth(() => sukaKarya(id))}
```

Kalau pengguna belum masuk, modal login muncul dan aksinya disimpan. Setelah
masuk, aksi itu jalan sendiri tanpa pengguna perlu mengklik ulang. Pola ini
sudah dipakai di seluruh aplikasi — ikuti, jangan bikin jalur sendiri.

## Atribut data-goes-to

Setiap kontrol interaktif punya `data-goes-to` yang menjelaskan tujuannya.
Mode Anotasi membaca atribut itu. Kalau menambah kontrol baru, tambahkan
atributnya juga.

## Sebelum mengirim PR

- `npm run build` lolos tanpa galat
- Cek di lebar 1440px dan di lebar ponsel
- Cek status belum masuk lewat `?auth=out` kalau menyentuh aksi terjaga
- Nyalakan mode Anotasi kalau menambah kontrol
