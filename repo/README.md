# ARTVAULT

Platform komunitas seni digital Indonesia: galeri karya, papan peringkat,
pemesanan komisi dengan escrow, dan kontes bulanan.

Repo ini berisi prototipe antarmuka yang sudah berjalan — 23 layar, alur
autentikasi lengkap, dan status belum-masuk — beserta spesifikasi desainnya.

## Menjalankan

```bash
npm install
npm run dev
```

Buka alamat yang muncul di terminal, biasanya http://localhost:5173.

## Isi repo

| Path | Isi |
|---|---|
| `src/App.jsx` | Seluruh prototipe. Besar dan sengaja belum dipecah — lihat catatan di bawah |
| `src/index.css` | Reset, font, cincin fokus merah, keyframes shimmer |
| `tailwind.config.js` | Token warna ARTVAULT sebagai nama Tailwind |
| `docs/DESIGN.md` | **Spesifikasi desain lengkap.** Baca ini dulu |
| `docs/DATA.md` | Sketsa model data untuk tahap database |
| `docs/starter-issues.md` | Daftar pekerjaan awal, siap dijadikan issue |

## Keadaan sekarang

Yang sudah jalan: navigasi antar layar, tumpukan riwayat dengan pemulihan
posisi scroll, suka, simpan, ikuti, seluruh overlay, validasi formulir, dan
gerbang autentikasi yang melanjutkan aksi tertunda setelah pengguna masuk.

Yang belum ada: backend, database, autentikasi sungguhan, unggah berkas, dan
pembayaran. Seluruh data masih konstanta di dalam `src/App.jsx`.

## Catatan penting

`src/App.jsx` berisi lebih dari empat ribu baris dalam satu berkas. Itu wajar
karena berasal dari prototipe HTML satu halaman, tapi **bukan bentuk akhir yang
diinginkan**. Pekerjaan pertama yang berguna adalah memecahnya:

```
src/
  components/   Pic, Av, Modal, Popover, Tip, Toaster, dan kawan-kawan
  screens/      satu berkas per layar
  data/         ARTWORKS, ORDERS, NOTIFS, COLLECTION_SEED
  hooks/        useEsc, useApp, dan state aplikasi
```

Lakukan bertahap, satu layar per pull request, supaya mudah ditinjau. Lihat
`docs/starter-issues.md`.

## Menjelajahi tanpa mengklik

Tambahkan parameter di URL untuk melompat langsung ke satu layar:

- `?screen=all` — seluruh layar bertumpuk dalam satu halaman, tiap layar berlabel
- `?screen=about` — satu layar; ganti dengan id mana pun dari tabel di bawah
- `?screen=discovery&auth=out` — status belum masuk

Ada juga tombol **Anotasi** di bar bawah. Menyalakannya menutupi layar dengan
kotak merah putus-putus yang memberi label tujuan setiap kontrol — peta
interaksi yang lengkap, berguna untuk memverifikasi perilaku yang tidak sempat
ditulis di dokumen.

## Daftar layar

| Id | Nama | Isi |
|---|---|---|
| `discovery` | Discovery | Feed karya harian, banner, baris kategori, grid masonry, infinite scroll |
| `ranking` | Ranking | Papan peringkat karya dan artist, filter periode |
| `commission` | Commission | Daftar artist buka komisi, filter harga dan kategori |
| `contest` | Kontes | Kontes aktif dan arsip, alur pengiriman karya |
| `artwork` | Artwork | Detail karya, suka, simpan, komentar, artist terkait |
| `profile` | Profil | Portofolio artist, tab karya/koleksi/tentang |
| `search` | Pencarian | Hasil pencarian dengan filter |
| `category` | Kategori | Karya dalam satu kategori |
| `favorites` | Favorit | Karya yang disukai pengguna |
| `collections` | Koleksi | Daftar koleksi milik pengguna |
| `collection` | Isi koleksi | Karya di dalam satu koleksi |
| `order` | Pesanan | Detail pesanan komisi, linimasa status, escrow |
| `upload` | Unggah | Alur unggah karya bertahap |
| `watermark` | Watermark Generator | Alat menambahkan watermark |
| `settings` | Pengaturan | Profil, komisi, notifikasi, privasi |
| `about` | Tentang | Halaman perusahaan mandiri |
| `login` | Masuk | Autentikasi, status gagal dan memuat |
| `signup` | Daftar | Pendaftaran, validasi username dan meter sandi |
| `forgot` | Lupa kata sandi | Permintaan tautan reset |
| `checkEmail` | Cek email | Konfirmasi kirim, hitung mundur 60 detik |
| `reset` | Atur ulang kata sandi | Kata sandi baru |
| `onboarding` | Onboarding | Dua langkah setelah daftar |

## Lisensi

MIT. Lihat `LICENSE`.
