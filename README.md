# Water Management System 🌊

Sistem manajemen dan pemantauan sumber daya air terintegrasi. Proyek ini menggunakan arsitektur **Monorepo** untuk menyatukan seluruh ekosistem layanan dalam satu repositori tunggal.

---

## Arsitektur Sistem

Proyek ini terbagi menjadi empat layanan utama yang saling terhubung:

| Layanan | Folder | Teknologi | Deskripsi |
| :--- | :--- | :--- | :--- |
| **Backend API** | `/api` | ![Laravel](https://img.shields.io/badge/Laravel-FF2D20?style=flat-square&logo=laravel&logoColor=white) | Core engine, database management, dan RESTful API. |
| **Admin Dashboard** | `/dashboard` | ![Nuxt](https://img.shields.io/badge/Nuxt.js-00DC82?style=flat-square&logo=nuxt.js&logoColor=white) | Panel monitoring data dan manajemen user. |
| **GIS Application** | `/gis-app` | ![Nuxt](https://img.shields.io/badge/Nuxt.js-00DC82?style=flat-square&logo=nuxt.js&logoColor=white) | Visualisasi pemetaan titik air dan geospasial. |
| **Mobile App** | `/mobile-app` | ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) | Aplikasi monitoring lapangan untuk pengguna mobile. |

---
