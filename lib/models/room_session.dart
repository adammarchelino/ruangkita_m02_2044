class RoomSession {
  final String roomName;
  final String activityName;
  final String time;
  final String status;
  final String description;

  const RoomSession({
    required this.roomName,
    required this.activityName,
    required this.time,
    required this.status,
    required this.description,
  });
}

const List<RoomSession> roomSessions = [
  RoomSession(
    roomName: 'Studio Foto',
    activityName: 'Pemotretan Konten Produk',
    time: '08:00 - 10:00',
    status: 'Berlangsung',
    description:
        'Studio digunakan untuk pemotretan konten produk mahasiswa dengan pencahayaan utama, backdrop, tripod, dan beberapa properti pendukung.',
  ),
  RoomSession(
    roomName: 'Studio Audio',
    activityName: 'Rekaman Podcast Teknologi Kampus',
    time: '09:00 - 11:00',
    status: 'Berlangsung',
    description:
        'Sesi rekaman podcast membahas perkembangan teknologi kampus dan membutuhkan ruangan kedap suara serta perangkat audio yang tersedia.',
  ),
  RoomSession(
    roomName: 'Ruang Editing',
    activityName: 'Editing Video Dokumentasi Kegiatan Kampus',
    time: '10:00 - 12:00',
    status: 'Akan Datang',
    description:
        'Ruang editing akan digunakan untuk menyunting video dokumentasi kegiatan kampus menggunakan workstation dan perangkat penyimpanan bersama.',
  ),
  RoomSession(
    roomName: 'Studio Streaming',
    activityName:
        'Live Streaming Seminar Pengembangan Aplikasi Mobile untuk Mahasiswa',
    time: '13:00 - 15:00',
    status: 'Akan Datang',
    description:
        'Studio dipersiapkan untuk siaran langsung seminar dengan beberapa kamera, mikrofon, koneksi internet stabil, serta operator streaming.',
  ),
  RoomSession(
    roomName: 'Studio Foto',
    activityName: 'Praktik Fotografi Dasar',
    time: '07:30 - 09:30',
    status: 'Selesai',
    description:
        'Praktik fotografi dasar telah selesai dilaksanakan dengan materi komposisi, pencahayaan, pengaturan kamera, dan pengambilan objek sederhana.',
  ),
  RoomSession(
    roomName: 'Studio Audio',
    activityName: 'Voice Over Materi Pembelajaran',
    time: '11:00 - 12:00',
    status: 'Selesai',
    description:
        'Ruangan digunakan untuk perekaman voice over materi pembelajaran dan seluruh sesi telah selesai tanpa kendala teknis.',
  ),
  RoomSession(
    roomName: 'Ruang Editing',
    activityName: 'Color Grading Video Pendek',
    time: '14:00 - 16:00',
    status: 'Tersedia',
    description:
        'Ruang editing sedang tersedia untuk mahasiswa yang membutuhkan workstation untuk color grading atau penyuntingan video pendek.',
  ),
  RoomSession(
    roomName: 'Studio Streaming',
    activityName: 'Persiapan Produksi Konten Media Sosial',
    time: '15:00 - 17:00',
    status: 'Tersedia',
    description:
        'Studio streaming dapat digunakan untuk persiapan produksi konten media sosial dengan fasilitas kamera, pencahayaan, dan perangkat pendukung.',
  ),
];
