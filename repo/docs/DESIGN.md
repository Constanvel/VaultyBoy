# Handoff: ARTVAULT

## Ringkasan

ARTVAULT adalah platform komunitas seni digital Indonesia: galeri karya, papan
peringkat, pemesanan komisi dengan escrow, dan kontes bulanan. Paket ini berisi
prototipe HTML lengkap dengan 23 layar, seluruh alur autentikasi, dan status
belum-masuk, siap direkonstruksi di codebase sungguhan.

Seluruh salinan teks berbahasa Indonesia dan sudah final — pakai apa adanya.

## Tentang berkas desain ini

Berkas di paket ini adalah **referensi desain yang dibuat dalam HTML** — prototipe
yang menunjukkan tampilan dan perilaku yang dituju, bukan kode produksi yang
disalin mentah-mentah.

Tugasnya adalah **membangun ulang desain ini di lingkungan codebase tujuan**
(React, Vue, Svelte, SwiftUI, native, apa pun) memakai pola dan pustaka yang
sudah ada di sana. Kalau belum ada codebase sama sekali, pilih framework yang
paling sesuai lalu implementasikan di situ.

Yang penting dipertahankan: token warna, skala tipografi, radius pill, struktur
layout, dan seluruh perilaku interaksi yang dijelaskan di bawah. Yang boleh
dibuang: cara prototipe ini mengatur state (satu komponen `App` raksasa dengan
`useState`), stub data, dan pemakaian Tailwind lewat CDN.

## Fidelity

**High-fidelity.** Warna, tipografi, spasi, dan interaksi sudah final. Bangun
ulang UI-nya setepat mungkin memakai pustaka yang ada di codebase. Setiap nilai
di bawah adalah nilai sebenarnya yang dipakai prototipe, bukan perkiraan.

Yang belum final: fotografi karya (memakai Unsplash sebagai pengganti), avatar
(inisial di atas warna solid), dan seluruh data (nama artist, harga, jumlah suka
semuanya karangan).

---

## Design tokens

### Warna

| Peran | Hex | Dipakai untuk |
|---|---|---|
| Merah utama | `#E81E28` | Isian tombol utama, pill aktif, ikon aksen, indikator nav |
| Merah aksen | `#C41A22` | Teks tautan, eyebrow, hover tombol utama, teks bantuan galat |
| Merah pressed | `#A9161D` | Status `:active` tombol merah |
| Merah tint | `#FEF2F3` | Latar item nav aktif, latar ikon amplop |
| Hitam teks | `#0A0A0B` | Judul, teks utama, label tebal |
| Abu teks | `#52525B` | Paragraf, teks sekunder |
| Abu muted | `#A1A1AA` | Placeholder, metadata, label nonaktif |
| Permukaan | `#F5F5F5` | Panel, band statistik, status `:active` tombol putih |
| Isian input | `#F4F4F5` | Latar field formulir saat istirahat |
| Hairline | `#E5E5E7` | Semua garis pemisah dan border 1px |
| Border muted | `#D4D4D8` | Border checkbox saat belum dicentang |
| Sukses | `#059669` | Toast berhasil, centang username tersedia, meter kuat |
| Peringatan | `#F59E0B` | Segmen tengah meter kekuatan sandi |
| Putih | `#FFFFFF` | Latar halaman, kartu, tombol sekunder |

Tidak ada panel gelap dan tidak ada gradien selain fade pada banner
(`linear-gradient(to top, rgba(0,0,0,0.72), transparent)`) dan scrim atas pada
artwork auth.

### Tipografi

Plus Jakarta Sans di semua tempat, fallback `Inter, system-ui, sans-serif`.

| Peran | Ukuran | Weight | Line-height | Tracking |
|---|---|---|---|---|
| Judul hero About | 44px | 800 | 1.06 | -0.02em |
| Judul penutup | 30px | 800 | 1.15 | -0.02em |
| Judul onboarding | 30px | 800 | 1.12 | -0.02em |
| Judul auth | 28px | 800 | 1.15 | -0.02em |
| Judul cek email | 26px | 800 | 1.15 | -0.02em |
| Angka statistik | 34px | 800 | 1 | normal |
| Judul bagian | 22px | 800 | normal | normal |
| Pernyataan misi | 20px | 500 | 1.55 | normal |
| Paragraf badan | 15px | 400 | 1.6 | normal |
| Teks antarmuka | 14px | 400–700 | normal | normal |
| Metadata / bantuan | 13px | 400–600 | normal | normal |
| Label field, mikro | 12px | 700 | normal | normal |
| Eyebrow | 11px | 800 | normal | 0.18em, uppercase |

### Spasi & bentuk

- Padding konten: 24px mobile, 48px desktop (`px-6 md:px-12`)
- Jarak bagian vertikal: 56px (`py-14`)
- Radius: pill `9999px` untuk semua tombol, input, dan chip; `16px` kartu besar;
  `12px` kartu kecil dan thumbnail; `8px` kotak ikon
- Lebar sidebar: 240px, fixed
- Lebar kolom auth: maksimal 400px; modal login 420px; onboarding 680px;
  pernyataan misi 640px
- Bayangan: hanya satu, pada bingkai hero About —
  `0 18px 44px -14px rgba(10,10,11,0.34)`

---

## Layar

Prototipe punya 23 layar. Buka `ARTVAULT.html?screen=all` untuk melihat semuanya
bertumpuk, atau `?screen=<id>` untuk satu layar. Tambahkan `&auth=out` untuk
melihat versi belum-masuk.

| Id | Nama | Tujuan |
|---|---|---|
| `discovery` | Discovery | Feed karya harian, banner, baris kategori, grid masonry |
| `ranking` | Ranking | Papan peringkat karya dan artist, filter periode |
| `commission` | Commission | Daftar artist yang buka komisi, filter harga dan kategori |
| `contest` | Kontes | Kontes aktif dan arsip, alur pengiriman karya |
| `artwork` | Artwork | Detail satu karya, suka, simpan, komentar, artist terkait |
| `profile` | Profil | Portofolio artist, tab karya/koleksi/tentang |
| `search` | Pencarian | Hasil pencarian dengan filter |
| `category` | Kategori | Karya dalam satu kategori |
| `favorites` | Favorit | Karya yang disukai pengguna |
| `collections` | Koleksi | Daftar koleksi milik pengguna |
| `collection` | Isi koleksi | Karya di dalam satu koleksi |
| `order` | Pesanan | Detail pesanan komisi, linimasa status, escrow |
| `upload` | Unggah | Alur unggah karya bertahap |
| `watermark` | Watermark Generator | Alat menambahkan watermark ke karya |
| `settings` | Pengaturan | Profil, komisi, notifikasi, privasi |
| `about` | Tentang | Halaman perusahaan mandiri |
| `login` | Masuk | Autentikasi |
| `signup` | Daftar | Pendaftaran akun |
| `forgot` | Lupa kata sandi | Permintaan tautan reset |
| `checkEmail` | Cek email | Konfirmasi pengiriman tautan |
| `reset` | Atur ulang kata sandi | Kata sandi baru |
| `onboarding` | Onboarding | Dua langkah setelah daftar |

### Kerangka aplikasi

Semua layar kecuali auth dan onboarding memakai kerangka yang sama.

**Sidebar** — `position: fixed`, kiri, lebar 240px, tinggi penuh, latar putih,
border kanan 1px `#E5E5E7`, susunan kolom flex.

- Logo di atas: kotak 32px merah `#E81E28` radius 8px berisi ikon palet putih
  16px, lalu wordmark 18px extrabold — "ART" `#0A0A0B` diikuti "VAULT" `#E81E28`
- Item nav: Discovery, Ranking, Commission, Kontes, lalu Favorit, Koleksi,
  Pesanan, Pengaturan, Notifikasi. Tinggi 40px, padding kiri 20px, ikon 17px,
  teks 14px semibold. Item aktif: latar `#FEF2F3`, teks `#C41A22`, dan batang
  merah 3px menempel di tepi kiri. Item istirahat: teks `#52525B`, hover latar
  `#FAFAFA`
- Lencana notifikasi: lingkaran merah 16px, angka putih 10px extrabold, hanya
  tampil saat sudah masuk
- Hairline, lalu item **Tentang** dengan ikon info — ini pintu ke halaman About
- Baris bawah dipisah border atas. **Saat masuk**: avatar 32px, nama, dan
  `@username`, membuka menu akun. **Saat belum masuk**: dua pill tersusun —
  "Masuk" putih berborder, lalu "Daftar" merah solid, keduanya tinggi 40px

**Kluster kanan atas** — melayang di kanan konten.

- **Saat masuk**: tombol "Unggah" merah dengan ikon 13px, lonceng 36px dengan
  titik merah 8px, avatar 32px
- **Saat belum masuk**: lonceng dan Unggah hilang sepenuhnya. Diganti pill
  "Masuk" putih dan pill "Daftar" merah, padding 20px horizontal

**Konten** — margin kiri 240px, kolom flex, footer menempel di bawah.

---

### Tentang (`about`)

Satu-satunya halaman yang boleh melanggar layout feed. Sidebar dan kluster kanan
atas tetap; hanya kolom konten yang berubah.

1. **Hero** — dua kolom, padding atas 48px, bawah 56px, gap 64px.
   Kiri: eyebrow "Tentang ARTVAULT" 11px extrabold `#C41A22` tracking 0.18em
   uppercase; judul 44px extrabold dua baris "Rumah bagi karya / artist
   Indonesia"; paragraf 15px `#52525B` maksimal 448px; dua pill — "Jelajahi
   Karya" merah ke Discovery, "Gabung Komunitas" putih berborder ke Daftar.
   Kanan: tiga bingkai karya bertumpuk dalam kotak 400×380px, masing-masing
   padding putih 8px, radius 16px, bayangan
   `0 18px 44px -14px rgba(10,10,11,0.34)`, rasio 4:5, rotasi −7°, +6°, −2°,
   z-index 1, 2, 3.

2. **Misi** — border atas dan bawah 1px, padding 56px. Satu paragraf 20px medium,
   rata tengah, maksimal 640px.

3. **Apa yang kami lakukan** — judul 22px, lalu empat kolom dipisah hairline
   vertikal (`border-l` pada kolom 2–4, padding horizontal 28px). Tiap kolom:
   ikon outline merah 22px, label 14px extrabold, satu baris deskripsi 13px abu.
   Isinya Discovery, Ranking, Commission, Contest.

4. **Angka kami** — band `#F5F5F5` dengan border atas **2px merah**, padding
   vertikal 48px. Empat kolom: angka 34px extrabold, label 13px abu. Nilainya
   1,2 Juta+ karya terunggah · 340.000+ artist aktif · 18.400+ komisi selesai ·
   96 kontes terselenggara.

5. **Cerita kami** — dua kolom, border bawah 1px. Kiri teks (judul 22px, dua
   paragraf 15px), kanan gambar full-bleed tinggi minimal 440px. Di mobile
   gambar naik ke atas.

6. **Keamanan komisi** — panel `#F5F5F5` radius 16px padding 40px. Header: kotak
   putih 44px radius 12px berisi ikon perisai merah 20px, judul 20px, satu baris
   deskripsi. Lalu tiga kartu putih radius 12px: lingkaran merah 24px berisi
   nomor putih 11px, judul 14px extrabold, deskripsi 13px.

7. **Tim** — judul 22px, empat kolom. Avatar lingkaran 72px berisi inisial,
   nama 14px bold `#0A0A0B`, peran 13px `#52525B`.

8. **FAQ** — judul 22px, lalu lima baris dipisah hairline, maksimal 672px. Baris
   tertutup: pertanyaan 14px bold, chevron 16px `#A1A1AA`. Baris terbuka:
   chevron berputar 90° dan berubah merah, jawaban 14px `#52525B` muncul di
   bawah. Baris pertama terbuka saat halaman dimuat. Mengklik baris terbuka
   menutupnya.

9. **Penutup** — border atas 1px, padding 64px, rata tengah. Judul 30px
   extrabold "Karyamu pantas ditemukan." maksimal 520px, lalu satu pill merah
   "Daftar Gratis". Tidak ada elemen lain.

---

### Masuk (`login`)

Layar penuh terbagi dua, tanpa sidebar.

**Kiri 45%** — satu karya memenuhi tepi, latar `#0A0A0B`. Scrim atas tinggi
144px dan scrim bawah tinggi 160px
(`linear-gradient(to top, rgba(0,0,0,0.72), transparent)`). Logo ARTVAULT putih
kecil di kiri atas (offset 28px), satu baris kredit putih di kiri bawah:
judul karya tebal lalu `· @username` pada opasitas 75%. Kolom ini hilang di
bawah breakpoint md.

**Kanan 55%** — putih, isi di tengah, lebar maksimal 400px.

Urutan dari atas: logo dengan wordmark → judul 28px extrabold "Masuk ke
ARTVAULT" → subjudul 14px abu → field.

- **Email atau username** — label 12px bold, input pill isian `#F4F4F5` tanpa
  border, padding kiri 16px kanan 44px, tinggi 46px, teks 14px. Fokus: border
  `#A1A1AA`
- **Kata sandi** — sama, dengan ikon mata 15px `#A1A1AA` di kanan yang
  membalik `type` antara password dan text; ikon berubah jadi mata-tercoret
  saat terlihat
- **Baris opsi** — kiri checkbox merah "Ingat saya" (kotak 18px radius 6px,
  dicentang jadi `#E81E28` dengan centang putih 11px stroke 3.5), kanan tautan
  12px semibold `#C41A22` "Lupa kata sandi?"
- **Tombol Masuk** — pill merah lebar penuh, tinggi 50px, teks 14px bold
- **Pemisah "atau"** — dua hairline dengan kata 12px `#A1A1AA` di tengah,
  margin vertikal 20px
- **Dua tombol sosial** — putih berborder, lebar penuh, bertumpuk gap 10px,
  masing-masing dengan kotak lambang 20px radius 6px: Google (huruf G biru
  `#4285F4` di atas `#F4F4F5`) dan Discord (huruf D putih di atas `#5865F2`)
- **Baris penutup** — 12px abu "Belum punya akun?" dengan tautan `#C41A22`
  "Daftar"

**Status:**
- *Gagal* — kedua field berganti jadi latar putih dengan border `#E81E28`, dan
  di bawah field sandi muncul baris bantuan: ikon segitiga peringatan 12px plus
  teks 12px `#C41A22` "Email atau kata sandi salah". Toast merah muncul
  bersamaan
- *Mengirim* — tombol menampilkan spinner 14px (border 2px putih 40% dengan tepi
  atas putih penuh, berputar) dan label berubah jadi "Memeriksa...", tombol
  nonaktif
- *Berhasil* — set status masuk, arahkan ke Discovery, toast hijau "Berhasil
  masuk / Selamat datang kembali"

Aturan validasi prototipe: berhasil bila email valid **atau** input lebih dari
dua karakter, dan sandi minimal enam karakter. Ganti dengan autentikasi
sungguhan.

### Daftar (`signup`)

Struktur sama, karya berbeda di kiri. Judul "Buat Akun".

Field berurutan: Nama lengkap, Username, Email, Kata sandi, Konfirmasi kata
sandi.

- **Username** memvalidasi langsung setelah tiga karakter. Tersedia: ikon centang
  lingkaran `#059669` 15px di dalam field dan baris "Username tersedia" hijau.
  Sudah dipakai: border field merah, ikon segitiga merah, baris "Username sudah
  dipakai" `#C41A22`. Daftar yang dianggap terpakai di prototipe: admin,
  artvault, rioart, syandra_art, neocityart, test
- **Kata sandi** menampilkan meter tiga segmen di bawah field: tiga batang tinggi
  4px dengan gap 6px. Kosong semuanya `#E5E5E7`. Kurang dari 8 karakter → satu
  segmen `#A1A1AA` label "Lemah". Minimal 8 karakter huruf saja → dua segmen
  `#F59E0B` label "Cukup". Minimal 8 karakter dengan angka atau simbol → tiga
  segmen `#059669` label "Kuat". Di bawahnya baris petunjuk 12px "Minimal 8
  karakter, tambahkan angka atau simbol." dengan label kekuatan di kanan
- **Konfirmasi** menampilkan border merah dan pesan "Kata sandi tidak cocok"
  begitu isinya berbeda, tanpa menunggu blur
- **Checkbox merah** "Saya setuju dengan Syarat & Ketentuan dan Kebijakan
  Privasi", kedua frasa itu `#C41A22` semibold
- **Tombol Buat Akun** tetap nonaktif — latar `#E5E5E7` teks `#A1A1AA` — sampai
  semua field valid dan kotak dicentang. Saat nonaktif, hover memunculkan
  tooltip yang menyebut apa yang kurang, contoh "Lengkapi dulu: email yang
  valid, centang syarat & ketentuan"
- Berhasil mendaftar mengarahkan ke **Onboarding**, bukan Discovery

Lalu pemisah "atau", dua tombol sosial, dan baris "Sudah punya akun? Masuk".

### Lupa kata sandi (`forgot`)

Struktur sama. Satu field email, pill merah "Kirim Tautan Reset", dan tautan
`#C41A22` "Kembali ke Masuk" di bawah. Email tidak valid memunculkan border
merah, baris "Format email tidak valid", dan toast galat. Berhasil membawa ke
Cek email dengan alamat diteruskan sebagai parameter.

### Cek email (`checkEmail`)

Konfirmasi rata tengah di kolom kanan. Kotak 56px radius 16px latar `#FEF2F3`
berisi ikon amplop merah 24px, judul 26px "Cek email kamu", satu baris abu, lalu
**alamat email tebal 14px**. Tombol merah "Buka Tautan Reset" mensimulasikan
klik tautan dan membawa ke layar Atur ulang.

Di bawahnya "Tidak menerima email?" dengan tombol teks "Kirim ulang". Tombol itu
mulai dalam keadaan abu `#A1A1AA` dan nonaktif selama **60 detik**, menampilkan
hitungan mundur dalam kurung, contoh "Kirim ulang (43s)". Setelah nol, warnanya
kembali `#C41A22` dan bisa diklik; mengklik memulai ulang hitungan dan
memunculkan toast.

### Atur ulang kata sandi (`reset`)

Dua field, kata sandi baru dan konfirmasi, dengan meter kekuatan yang sama persis
dan pesan ketidakcocokan yang sama. Pill merah "Simpan Kata Sandi" nonaktif
sampai kekuatan minimal "Cukup" dan kedua isian cocok. Berhasil kembali ke Masuk
dengan toast "Kata sandi diperbarui".

### Onboarding (`onboarding`)

Tampil sekali langsung setelah Daftar. Tidak ada sidebar. Bar atas berisi logo di
kiri dan tombol teks abu "Lewati" di kanan — ada di kedua langkah, dan langsung
ke Discovery.

Kolom tengah maksimal 680px. Di atas konten ada indikator dua segmen (batang 4px,
segmen aktif `#E81E28`, sisanya `#E5E5E7`) lalu eyebrow "Langkah N dari 2".

**Langkah 1** — judul 30px "Apa yang ingin kamu lihat?", satu baris deskripsi,
lalu dua belas chip kategori pill. Chip istirahat: putih berborder `#E5E5E7`
teks `#52525B`. Chip terpilih: isian `#E81E28` teks putih. Tombol "Lanjut"
nonaktif sampai **tiga chip** terpilih; di sebelahnya teks pembantu yang
menghitung, "Pilih 2 lagi" lalu "3 kategori dipilih".

**Langkah 2** — judul "Artist untuk kamu ikuti", lalu enam kartu artist dalam
grid dua kolom. Tiap kartu: border 1px radius 16px padding 12px, thumbnail 44px
radius 12px, nama 14px bold, meta 12px abu, dan pill "Ikuti" merah di kanan yang
berubah jadi "Mengikuti" putih berborder saat ditekan. Pill merah "Mulai
Jelajahi" menyelesaikan alur; tombol teks "Kembali" di sebelahnya kembali ke
langkah 1.

Menyelesaikan memunculkan toast yang merangkum pilihan; melewati memunculkan
toast sambutan biasa.

---

## Status belum masuk

Saat tidak ada yang masuk, aplikasi tetap bisa dipakai penuh untuk menjelajah.

**Yang berubah:**
- Sidebar mengganti baris avatar dengan pill "Masuk" putih dan pill "Daftar"
  merah
- Kluster kanan atas menyembunyikan lonceng dan tombol "Unggah" sepenuhnya,
  menggantinya dengan pill "Masuk" dan "Daftar"
- Lencana hitung notifikasi di sidebar hilang
- Bar atas mobile mengganti tombol "Unggah" dengan tombol "Masuk"

**Yang tetap jalan:** menjelajah feed, mencari, membuka kategori, membuka detail
karya, membuka profil artist, membaca komentar, dan melihat halaman Tentang.

**Yang dijaga:** suka, simpan ke koleksi, ikuti artist, berkomentar, memesan
komisi, mengirim karya ke kontes, mengunggah, membuka notifikasi, dan membuka
pengaturan.

### Pola gerbang autentikasi

Ini bagian yang paling penting untuk ditiru persis.

Setiap aksi terjaga dibungkus `requireAuth(fn)`. Kalau sudah masuk, `fn`
langsung jalan. Kalau belum, aksinya **disimpan** dan modal login muncul. Setelah
berhasil masuk, modal menutup dan **aksi tertunda itu dijalankan sendiri** —
pengguna tidak perlu mengulang klik.

Contohnya: pengunjung anonim menekan tombol suka pada sebuah karya. Modal muncul.
Ia masuk. Modal menutup, dan karya itu **langsung tersuka** dengan animasi hati
yang normal.

Modalnya kartu putih 420px: judul "Masuk ke ARTVAULT", satu baris penjelasan,
field email dan sandi yang sama persis dengan halaman Masuk, tautan "Lupa kata
sandi?", pill merah "Masuk", pemisah "atau", dua tombol sosial, dan baris
"Belum punya akun? Daftar". Menekan Daftar atau Lupa kata sandi menutup modal
lalu pindah ke halaman penuh.

---

## State

State yang dipegang di akar aplikasi:

| State | Tipe | Keterangan |
|---|---|---|
| `view` | `{ screen, params }` | Layar aktif dan parameternya |
| `history` | array | Tumpukan navigasi, menyimpan posisi scroll tiap entri |
| `loggedIn` | boolean | Status autentikasi |
| `overlay` | objek atau null | Modal/dropdown yang sedang terbuka |
| `pendingAction` | fungsi atau null | Aksi yang menunggu autentikasi |
| `likes` | Set | Id karya yang disukai |
| `saves` | Set | Id karya yang tersimpan |
| `follows` | Set | Id artist yang diikuti |

State lokal per layar: nilai field formulir, indeks FAQ yang terbuka, langkah
onboarding, hitungan mundur kirim ulang, status kirim.

---

## Aturan global

Aturan ini berlaku di seluruh aplikasi dan sudah konsisten di prototipe.

- **Toast** muncul di tengah bawah, bertahan 3 detik. Berhasil `#059669`, gagal
  `#C41A22`. Punya judul dan baris deskripsi opsional
- **Fokus keyboard** memakai cincin merah `:focus-visible` di setiap kontrol.
  Jangan biarkan cincin biru bawaan browser
- **Setiap kontrol** punya status hover, pressed, dan nonaktif. Tombol merah:
  `#E81E28` → `#C41A22` → `#A9161D`. Tombol putih: putih → `#F5F5F5` →
  `#EDEDEF`. Nonaktif: latar `#E5E5E7` teks `#A1A1AA`
- **Overlay** menutup lewat Esc, tombol X, dan klik di luar
- **Tombol kembali** memulihkan posisi scroll layar sebelumnya
- **Transisi** memakai `transition-colors` durasi bawaan Tailwind (150ms).
  Tidak ada animasi lain selain spinner dan putaran chevron FAQ
- Gambar punya rasio tetap dan skeleton `#F5F5F5` saat memuat, dengan fallback
  ikon palet abu di atas `#F1F1F3` bila gagal

---

## Aset

- **Fotografi karya** — 25 foto Unsplash unik dipakai sebagai pengganti. Diambil
  lewat `imgUrl(photoId, w, h)` yang menyusun URL Unsplash. **Ganti dengan
  gambar sungguhan.** Rasio yang dipakai: banner 21:9, ubin 5:3, thumbnail 1:1,
  portofolio 4:3, bingkai hero About 4:5
- **Ikon** — Lucide, ukuran 11–24px tergantung konteks
- **Font** — Plus Jakarta Sans dari Google Fonts, weight 400 sampai 800
- **Avatar** — tidak ada berkas gambar. Inisial putih di atas lingkaran warna
  solid: `#E81E28`, `#6366F1`, `#F97316`, `#059669`

---

## Berkas di paket ini

| Berkas | Isi |
|---|---|
| `ARTVAULT.html` | Prototipe mandiri, gambar sudah tertanam. Buka langsung di browser, tanpa server. Butuh internet hanya untuk Tailwind |
| `Artvault.jsx` | Sumber lengkap, 1 baris. Semua komponen, data, dan logika |
| `ARTVAULT.dc.html` | Pembungkus yang memuat sumber di lingkungan aslinya |

### Menjelajahi prototipe

Buka `ARTVAULT.html` di browser. Tambahkan parameter untuk melompat:

- `?screen=all` — seluruh 23 layar bertumpuk, tiap layar diberi label
- `?screen=about` — satu layar; ganti dengan id mana pun dari tabel layar
- `?screen=discovery&auth=out` — status belum masuk

Ada juga mode **Anotasi** di bar bawah prototipe: menyalakannya menutupi layar
dengan kotak merah putus-putus yang memberi label tujuan setiap kontrol. Itu peta
interaksi yang lengkap — pakai untuk memverifikasi perilaku yang tidak tertulis
di dokumen ini.

### Cara membaca sumbernya

`Artvault.jsx` disusun berurutan: ikon, lalu konstanta data (`ARTWORKS`,
`ORDERS`, `NOTIFS`, `COLLECTION_SEED`), lalu komponen bersama (`Pic`, `Av`,
`Modal`, `Tip`), lalu satu komponen per layar, lalu overlay, lalu `App` di
paling bawah yang memegang seluruh state dan routing.

Cari `function <NamaLayar>Screen` untuk melompat ke layar mana pun. Cari
`data-goes-to` untuk menemukan setiap kontrol interaktif — atribut itu memberi
label tujuan tiap kontrol dan itulah yang dibaca mode Anotasi.
