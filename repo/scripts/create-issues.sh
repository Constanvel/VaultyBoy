#!/usr/bin/env bash
# Membuat seluruh issue awal sekaligus. Butuh GitHub CLI: https://cli.github.com
# Pakai: bash scripts/create-issues.sh
set -euo pipefail

REPO="Constanvel/project"

for L in struktur backend tampilan; do
  gh label create "$L" --repo "$REPO" --force >/dev/null 2>&1 || true
done

gh issue create --repo "$REPO" --label "struktur" \
  --title "Pecah src/App.jsx jadi modul per layar" \
  --body "Berkas ini lebih dari empat ribu baris. Pindahkan ke `src/components/`, `src/screens/`, `src/data/`, dan `src/hooks/` sesuai struktur di README. Kerjakan bertahap, satu layar per PR, jangan sekaligus."

gh issue create --repo "$REPO" --label "struktur" \
  --title "Pindahkan data karangan ke src/data/" \
  --body "`ARTWORKS`, `ORDERS`, `NOTIFS`, dan `COLLECTION_SEED` masih di tengah `App.jsx`. Keluarkan jadi modul sendiri supaya nanti gampang diganti panggilan API."

gh issue create --repo "$REPO" --label "struktur" \
  --title "Ganti kelas hex dengan token Tailwind" \
  --body "`App.jsx` penuh `bg-[#E81E28]` dan sejenisnya. Token yang sama sudah ada namanya di `tailwind.config.js`. Ganti sambil memecah berkas, jangan jadi PR terpisah yang menyentuh semua baris."

gh issue create --repo "$REPO" --label "struktur" \
  --title "Angkat state aplikasi keluar dari komponen App" \
  --body "Semua state ada di satu komponen: view, history, loggedIn, overlay, pendingAction, likes, saves, follows. Pindahkan ke context atau store supaya layar tidak perlu menerima props berantai."

gh issue create --repo "$REPO" --label "backend" \
  --title "Autentikasi sungguhan" \
  --body "Validasi sekarang cuma pura-pura — berhasil kalau sandi minimal enam karakter. Sambungkan ke backend, simpan sesi, dan pertahankan pola `requireAuth` yang melanjutkan aksi tertunda setelah masuk."

gh issue create --repo "$REPO" --label "backend" \
  --title "Skema database awal" \
  --body "Ikuti sketsa di `docs/DATA.md`. Mulai dari users, artworks, likes, follows. Escrow dan pesanan menyusul karena butuh diskusi lebih dulu."

gh issue create --repo "$REPO" --label "backend" \
  --title "Unggah gambar" \
  --body "Layar Unggah sudah ada tampilannya tapi belum menyimpan apa pun. Butuh object storage, pembuatan thumbnail, dan pembatasan ukuran."

gh issue create --repo "$REPO" --label "backend" \
  --title "Alur escrow pesanan komisi" \
  --body "Bagian paling sensitif. Baca bagian Keamanan komisi di `docs/DESIGN.md` dan `docs/DATA.md` sebelum mulai. Butuh jejak audit yang tidak bisa diubah."

gh issue create --repo "$REPO" --label "tampilan" \
  --title "Responsif di bawah 768px" \
  --body "Prototipe dirancang untuk 1440px. Sidebar sudah punya versi mobile tapi banyak grid dan tabel yang belum diperiksa di layar sempit."

gh issue create --repo "$REPO" --label "tampilan" \
  --title "Aksesibilitas" \
  --body "Cincin fokus sudah merah di semua kontrol, tapi belum ada label ARIA di tombol ikon, belum ada jebakan fokus di modal, dan urutan tab di overlay belum diperiksa."

gh issue create --repo "$REPO" --label "tampilan" \
  --title "Ganti gambar Unsplash" \
  --body "Dua puluh lima foto Unsplash dipakai sebagai pengganti. Ganti dengan aset asli dan pindahkan `imgUrl` ke CDN sendiri."

gh issue create --repo "$REPO" --label "tampilan" \
  --title "Status kosong dan status galat" \
  --body "Belum ada tampilan untuk feed kosong, pencarian tanpa hasil, koleksi kosong, atau gagal memuat. Ikuti gaya fallback gambar yang sudah ada."

echo "Selesai. Lihat: https://github.com/$REPO/issues"
