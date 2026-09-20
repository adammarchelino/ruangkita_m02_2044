# AI Usage

## Alat/Model yang Digunakan

ChatGPT (GPT-5.6 Luna)

## Tujuan Penggunaan AI

AI digunakan sebagai tutor, reviewer, debugger, dan pendamping dalam pengerjaan Tugas Rumah Modul 02 Mobile Development.

Penggunaan AI terutama untuk:

* memahami requirement tugas dan checklist dosen;
* membantu menyusun dan menjelaskan struktur kode Flutter;
* menjelaskan konsep StatefulWidget, setState(), LayoutBuilder, constraints, Expanded, Stack, Positioned, Wrap, ChoiceChip, dan showModalBottomSheet;
* membantu mencari dan memperbaiki masalah layout/overflow;
* membantu mereview hasil implementasi dan memastikan requirement tugas terpenuhi.

## Ringkasan Prompt

Prompt utama berfokus pada pengerjaan tugas secara bertahap berdasarkan dokumen dosen, dengan AI sebagai tutor. Setiap kode yang diberikan AI diminta untuk dijelaskan maksud, alasan penggunaan widget, alur state, dan pengaruhnya terhadap layout.

AI juga digunakan untuk membantu menganalisis dua masalah nyata yang ditemukan saat pengujian:

1. RenderFlex overflow pada layout medium dan expanded.
2. Filter status tidak memperbarui daftar card pada layout compact/mobile.

## Bagian Kode yang Terpengaruh

Bagian kode yang mendapat bantuan dari AI meliputi:

* `lib/models/room_session.dart`
* `lib/main.dart`
* `lib/modul02/studi_kasus/ruang_praktikum.dart`

Kode yang dibantu mencakup model data, struktur halaman utama, card sesi ruang, responsive layout, filter status, BottomSheet detail, kontrol lokal, dan Material 3 Light/Dark Mode.

## Perubahan yang Dilakukan Setelah Menerima Saran AI

Kode tidak langsung digunakan tanpa pemeriksaan. Implementasi dijalankan, diuji, dan disesuaikan berdasarkan hasil pengujian.

Perubahan yang dilakukan selama proses antara lain:

* mengganti `childAspectRatio` pada grid menjadi `mainAxisExtent` setelah ditemukan RenderFlex overflow pada layout medium dan expanded;
* memperbaiki filter compact agar menggunakan `filteredSessions` sehingga perubahan `ChoiceChip` benar-benar memperbarui daftar card;
* menyesuaikan struktur theme agar Material 3 Light/Dark Mode dikelola melalui `MaterialApp`;
* melakukan pengujian pada beberapa ukuran viewport dan memastikan tidak terdapat overflow pada hasil akhir.

## Refleksi

Penggunaan AI membantu proses belajar terutama dalam memahami hubungan antara constraints, ukuran widget, state, dan perubahan layout. Kode yang digunakan tetap dipahami sebelum dimasukkan ke repository, karena seluruh struktur dan perubahan kode diusahakan dapat dijelaskan saat Individual Code Defense.
