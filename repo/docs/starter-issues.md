# Pekerjaan awal

Dua belas issue untuk dibuka di GitHub. Urutannya kira-kira urutan kerja yang
masuk akal: rapikan struktur dulu, baru backend, tampilan bisa jalan paralel.

Jalankan `bash scripts/create-issues.sh` untuk membuat semuanya sekaligus
(butuh GitHub CLI), atau salin manual dari sini.

## 1. Pecah src/App.jsx jadi modul per layar

`struktur`

Berkas ini lebih dari empat ribu baris. Pindahkan ke `src/components/`, `src/screens/`, `src/data/`, dan `src/hooks/` sesuai struktur di README. Kerjakan bertahap, satu layar per PR, jangan sekaligus.

## 2. Pindahkan data karangan ke src/data/

`struktur`

`ARTWORKS`, `ORDERS`, `NOTIFS`, dan `COLLECTION_SEED` masih di tengah `App.jsx`. Keluarkan jadi modul sendiri supaya nanti gampang diganti panggilan API.

## 3. Ganti kelas hex dengan token Tailwind

`struktur`

`App.jsx` penuh `bg-[#E81E28]` dan sejenisnya. Token yang sama sudah ada namanya di `tailwind.config.js`. Ganti sambil memecah berkas, jangan jadi PR terpisah yang menyentuh semua baris.

## 4. Angkat state aplikasi keluar dari komponen App

`struktur`

Semua state ada di satu komponen: view, history, loggedIn, overlay, pendingAction, likes, saves, follows. Pindahkan ke context atau store supaya layar tidak perlu menerima props berantai.

## 5. Autentikasi sungguhan

`backend`

Validasi sekarang cuma pura-pura — berhasil kalau sandi minimal enam karakter. Sambungkan ke backend, simpan sesi, dan pertahankan pola `requireAuth` yang melanjutkan aksi tertunda setelah masuk.

## 6. Skema database awal

`backend`

Ikuti sketsa di `docs/DATA.md`. Mulai dari users, artworks, likes, follows. Escrow dan pesanan menyusul karena butuh diskusi lebih dulu.

## 7. Unggah gambar

`backend`

Layar Unggah sudah ada tampilannya tapi belum menyimpan apa pun. Butuh object storage, pembuatan thumbnail, dan pembatasan ukuran.

## 8. Alur escrow pesanan komisi

`backend`

Bagian paling sensitif. Baca bagian Keamanan komisi di `docs/DESIGN.md` dan `docs/DATA.md` sebelum mulai. Butuh jejak audit yang tidak bisa diubah.

## 9. Responsif di bawah 768px

`tampilan`

Prototipe dirancang untuk 1440px. Sidebar sudah punya versi mobile tapi banyak grid dan tabel yang belum diperiksa di layar sempit.

## 10. Aksesibilitas

`tampilan`

Cincin fokus sudah merah di semua kontrol, tapi belum ada label ARIA di tombol ikon, belum ada jebakan fokus di modal, dan urutan tab di overlay belum diperiksa.

## 11. Ganti gambar Unsplash

`tampilan`

Dua puluh lima foto Unsplash dipakai sebagai pengganti. Ganti dengan aset asli dan pindahkan `imgUrl` ke CDN sendiri.

## 12. Status kosong dan status galat

`tampilan`

Belum ada tampilan untuk feed kosong, pencarian tanpa hasil, koleksi kosong, atau gagal memuat. Ikuti gaya fallback gambar yang sudah ada.
