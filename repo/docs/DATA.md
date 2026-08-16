# Sketsa model data

Catatan awal untuk tahap database. Belum ada yang dibangun — ini titik mulai
diskusi, bukan keputusan final.

Seluruh data sekarang masih konstanta di dalam `src/App.jsx`: `ARTWORKS`,
`ORDERS`, `NOTIFS`, dan `COLLECTION_SEED`. Bentuk konstanta itu sengaja dibuat
mirip baris tabel supaya gampang dipindahkan.

## Tabel

**users** — id, username unik, nama, email, sandi terenkripsi, bio, avatar,
lokasi, tautan, status buka komisi, waktu dibuat.

**artworks** — id, user id, judul, deskripsi, url gambar, rasio, kategori,
tag, hitungan suka, hitungan dilihat, waktu diunggah.

**likes** — user id, artwork id, waktu. Kunci gabungan keduanya.

**follows** — pengikut id, diikuti id, waktu. Kunci gabungan keduanya.

**collections** — id, user id, nama, sampul, privat atau tidak.
**collection_items** — collection id, artwork id, waktu.

**comments** — id, artwork id, user id, isi, balasan ke comment id, waktu.

**commissions** — id, artist id, nama paket, deskripsi, harga, estimasi hari,
jumlah revisi, status aktif.

**orders** — id, klien id, artist id, commission id, status, harga, catatan,
waktu dibuat, waktu selesai. Status: menunggu, dibayar, dikerjakan, revisi,
selesai, sengketa, batal.

**order_events** — order id, jenis, isi, waktu. Ini yang mengisi linimasa di
layar Pesanan.

**contests** — id, judul, tema, hadiah, waktu buka, waktu tutup.
**contest_entries** — contest id, artwork id, user id, waktu.

**notifications** — id, user id, jenis, aktor id, target id, sudah dibaca,
waktu.

## Yang perlu dipikirkan lebih dulu

**Escrow.** Ini bagian paling sensitif. Dana ditahan sampai kedua pihak
sepakat, jadi butuh tabel transaksi terpisah dengan catatan yang tidak bisa
diubah, bukan sekadar kolom status di `orders`. Sengketa juga perlu jejak
audit.

**Hitungan suka dan dilihat.** Menghitung `COUNT(*)` setiap kali halaman dibuka
akan berat begitu datanya banyak. Simpan angkanya di kolom `artworks` dan
perbarui lewat trigger atau job.

**Peringkat.** Spesifikasi menyebut skor gabungan suka, komentar, dan dilihat
sepanjang usia karya, dihitung ulang setiap jam. Itu pekerjaan job terjadwal
yang menulis ke tabel ringkasan, bukan query langsung.

**Unggah gambar.** Butuh object storage terpisah, bukan kolom database. Simpan
url dan ukurannya saja.
