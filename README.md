# Resepin - Tugas Pemrograman Visual dan Pirant Bergerak

## Anggota Kelompok
1. Daffa Faiz Restu Oktavian 2309013
2. Dina Agustina 2303573
3. M Isa Abdullah 2303508
4. Narendra Ridha Baihaqi 2308882
5. Raffi Adzril Alfaiz 2308355

## Penjelasan Apps
Resepin adalah aplikasi Flutter yang dirancang untuk membantu pengguna mencari resep berdasarkan bahan, tren, dan preferensi lainnya. Aplikasi ini mendukung mode terang dan gelap, serta memiliki berbagai fitur untuk mempermudah eksplorasi resep.


## Fitur Utama

- **Cari Resep Berdasarkan Bahan**: Pilih bahan yang Anda miliki dan temukan resep yang sesuai.
- **Trending Resep**: Jelajahi resep yang sedang populer.
- **Resep Baru**: Temukan resep terbaru yang ditambahkan.
- **Notifikasi**: Dapatkan pemberitahuan tentang resep dan fitur baru.
- **Rencana Menu**: Rencanakan menu harian Anda dengan mudah.
- **Tambah Resep**: Tambahkan resep favorit Anda ke dalam aplikasi.

## Struktur Folder

```
lib/
├── app.dart   # Konfigurasi utama aplikasi
├── main.dart  # Entry point aplikasi
├── core/      # Konstanta dan tema aplikasi
├── data/  # Data statis seperti daftar bahan
├── models/ # Model data seperti `Ingredient`
├── providers/  # State management untuk tema
├── screens/ # Semua layar aplikasi
│   ├── home/   # Layar utama dan fitur terkait
│   ├── login/  # Layar login dan registrasi
│   ├── settings/ # Layar pengaturan dan profil
│   ├── rencana/ # Layar rencana menu
│   ├── add/ # Layar untuk menambahkan resep
├── widgets/ # Widget yang dapat digunakan
```

## Layar yang tersedia

### Beranda

| GIF | Penjelasan |
| --- | ---------- |
| ![Home](dokumentasi-screen/home.gif) | **Home**: Layar utama aplikasi yang menampilkan berbagai fitur seperti pencarian resep, tren, dan resep baru. |

### Cari Resep Berdasarkan Bahan

| GIF | Penjelasan |
| --- | ---------- |
| ![Cari Resep](path/to/cari-resep.gif) | **Cari Resep Berdasarkan Bahan**: Pilih bahan yang Anda miliki dan temukan resep yang sesuai. |

### Trending

| GIF | Penjelasan |
| --- | ---------- |
| ![Trending](path/to/trending.gif) | **Trending**: Jelajahi resep yang sedang populer di kalangan pengguna. |

### Resep Baru

| GIF | Penjelasan |
| --- | ---------- |
| ![Resep Baru](path/to/resep-baru.gif) | **Resep Baru**: Temukan resep terbaru yang ditambahkan ke aplikasi. |

### Notifikasi

| GIF | Penjelasan |
| --- | ---------- |
| ![Notifikasi](path/to/notifikasi.gif) | **Notifikasi**: Dapatkan pemberitahuan tentang resep dan fitur baru. |

### Rencana Menu

| GIF | Penjelasan |
| --- | ---------- |
| ![Rencana Menu](path/to/rencana-menu.gif) | **Rencana Menu**: Rencanakan menu harian Anda dengan mudah. |

### Tambah Resep

| GIF | Penjelasan |
| --- | ---------- |
| ![Tambah Resep](path/to/tambah-resep.gif) | **Tambah Resep**: Tambahkan resep favorit Anda ke dalam aplikasi. |

### Profil

| GIF | Penjelasan |
| --- | ---------- |
| ![Profil](path/to/profil.gif) | **Profil**: Kelola profil Anda, termasuk pengaturan dan preferensi. |

### Detail Resep

| GIF | Penjelasan |
| --- | ---------- |
| ![Detail Resep](path/to/detail-resep.gif) | **Detail Resep**: Lihat detail lengkap dari resep yang dipilih. |

### Forgot Password

| GIF | Penjelasan |
| --- | ---------- |
| ![Forgot Password](path/to/forgot-password.gif) | **Forgot Password**: Atur ulang kata sandi Anda jika lupa. |

### Loading Screens

| GIF | Penjelasan |
| --- | ---------- |
| ![Loading](path/to/loading.gif) | **Loading Screens**: Animasi loading untuk transisi antar layar. |

### Register

| GIF | Penjelasan |
| --- | ---------- |
| ![Register](path/to/register.gif) | **Register**: Daftar akun baru untuk menggunakan aplikasi. |

## Cara Menjalankan Aplikasi

1. Pastikan Anda telah menginstal [Flutter](https://flutter.dev).
2. Clone repositori ini:
   ```bash
   git clone https://github.com/username/resepin.git
   ```
3. Masuk ke direktori proyek:
   ```bash
   cd resepin
   ```
4. Jalankan perintah berikut untuk menginstal dependensi:
   ```bash
   flutter pub get
   ```
5. Jalankan aplikasi:
   ```bash
   flutter run
   ```


## Kontribusi

Kami menerima kontribusi dari siapa saja. Silakan buat pull request atau buka issue untuk melaporkan bug atau fitur baru.

