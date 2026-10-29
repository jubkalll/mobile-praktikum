# flutter_application_1_juberta_kalvarisman_waruwu

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Proyek Pemrograman Mobile
## Deskripsi
# Course Data Manager (Course Explorer v2)

Aplikasi mobile Flutter untuk manajemen data mata kuliah (*Course Data Manager*) yang dikembangkan sebagai bagian dari praktikum RESTful API, Backend Services, dan Database Integration (Pertemuan 7). Aplikasi ini merupakan pengembangan lanjutan dari Course Explorer v2 dengan integrasi backend penuh ke **Supabase** serta penerapan **Repository Pattern**.

## 🚀 Fitur Utama
- **Integrasi Supabase (PostgreSQL):** Penyimpanan data persisten secara *real-time* untuk operasi CRUD.
- **Repository Pattern & Service Layer:** Pemisahan struktur yang jelas antara UI, State Management (Provider), Repository, dan Data Source.
- **Operasi CRUD Lengkap:** 
  - **Create:** Menambah data course baru ke database.
  - **Read:** Menampilkan daftar course secara dinamis.
  - **Update:** Mengubah informasi course yang sudah ada.
  - **Delete:** Menghapus course dengan dialog konfirmasi.
- **Async State Management:** Penanganan state yang lengkap meliputi *Loading*, *Success*, *Empty*, serta *Error* dengan tombol *Retry*.
- **Fitur Tambahan:** Navigasi responsif, halaman detail course, dan pengelolaan daftar *Favorites*.

## 🛠️ Tech Stack & Arsitektur
- **Framework:** Flutter & Dart
- **State Management:** Provider
- **Backend / Database:** Supabase (`supabase_flutter`)
- **Arsitektur:** Model → Service / Data Source → Repository → Provider → UI

## 📱 Identitas Pengembang
- **Nama:** Juberta Kalvarisman Waruwu
- **NIM:** 2415051051
- **Program Studi:** Pendidikan Teknik Informatika (UNDIKSHA)

## ⚙️ Cara Menjalankan Aplikasi
1. Clone repository ini ke komputer lokal Anda:
   ```bash
   git clone <URL_REPOSITORY_ANDA>
## Pengembang
Nama panggilan / akun GitHub: jubkalll
## Status
Proyek awal perkuliahan.
# Proyek Pemrograman Mobile

## Deskripsi
Aplikasi latihan untuk pemrograman mobile.

## Pengembang
Nama panggilan / akun GitHub: jubkalll

## Status
Proyek awal perkuliahan.

---

## Tujuan Aplikasi
- Menghubungkan aplikasi mobile Flutter dengan layanan backend Supabase (PostgreSQL) agar data mata kuliah dapat disimpan, diakses, dan dikelola secara real-time dan persisten.
- Menerapkan arsitektur perangkat lunak yang bersih dan terstruktur (Repository Pattern) yang memisahkan antara Model, Service/Data Source, Repository, State Management (Provider), dan UI.
- Mengelola operasi CRUD secara lengkap, yang meliputi Create (menambah data), Read (membaca/menampilkan data), Update (memperbarui data), dan Delete (menghapus data).
- Menyediakan penanganan asynchronous state yang andal, mencakup Loading state, Success state, Empty state, serta Error handling yang dilengkapi tombol Retry.
- Mempertahankan konsistensi fitur dari pertemuan sebelumnya, seperti navigasi responsif (NavigationBar/NavigationRail), halaman detail mata kuliah, dan pengelolaan daftar Favorites.

## Rencana Fitur
Berikut adalah 3 fitur utama yang direncanakan untuk aplikasi ini:
1. [Fitur 1, misal: Pencatatan pemasukan dan pengeluaran]
2. [Fitur 2, misal: Grafik laporan keuangan bulanan]
3. [Fitur 3, misal: Pengingat tagihan otomatis]

## Cara Menjalankan Aplikasi
Untuk menjalankan proyek Flutter ini di komputer lokal, jalankan perintah berikut secara berurutan di terminal:

1. Unduh semua *dependencies*:
   ```bash
   flutter pub get
   # Course Explorer v2 - Architecture Audit

## Struktur Folder & Tanggung Jawab Layer
- **`models/`**: Definisi struktur data/objek (`Course`) dan fungsi parsing `fromJson`.
- **`services/`**: Menangani detail teknis sumber data (membaca file JSON via `rootBundle`).
- **`repositories/`**: Lapisan abstraksi data antara Service dan Provider.
- **`providers/`**: Pengelola state aplikasi (`CourseProvider`) menggunakan `ChangeNotifier`.
- **`views/`**: Tampilan antarmuka pengguna (Screen/Halaman).
- **`widgets/`**: Komponen UI yang dapat digunakan kembali (`CourseCard`).

## Dependency Direction
Screen/Widget -> Provider -> Repository -> Service
Endpoint yang digunakan: https://api.example.com/courses (API Dummy/Latihan)
Status code: 200
Resource JSON:
{
  "id": 1,
  "code": "MOB01",
  "title": "Git & GitHub",
  "credits": 2,
  "status": "active"
}