import 'package:flutter/material.dart';

class ResepinTab extends StatelessWidget {
  const ResepinTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final notifications = [
      {
        "title": "Fitur Simpan Offline Hadir!",
        "subtitle": "Sekarang kamu bisa simpan resep favorit tanpa internet.",
        "time": "11.35",
        "unread": true
      },
      {
        "title": "Update Aplikasi Terbaru",
        "subtitle": "Cek tampilan baru dengan pencarian resep yang lebih cepat.",
        "time": "09.10",
        "unread": true
      },
      {
        "title": "Resep Baru dari Chef Andi",
        "subtitle": "Lihat resep 'Ayam Bakar Sambal Matah' yang baru dirilis!",
        "time": "Kemarin",
        "unread": true
      },
      {
        "title": "Event Spesial: Tantangan Resep Ramadan",
        "subtitle": "Ikuti challenge dan menangkan voucher belanja!",
        "time": "2 hari lalu",
        "unread": true
      },
      {
        "title": "Rekomendasi Resep Minggu Ini",
        "subtitle": "Kami pilihkan 5 resep populer khusus untuk kamu.",
        "time": "3 hari lalu",
        "unread": true
      },
      {
        "title": "Favoritmu Jadi Trending",
        "subtitle": "Resep 'Pisang Goreng Coklat' milikmu masuk trending minggu ini!",
        "time": "4 hari lalu",
        "unread": false
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: notifications.length,
      itemBuilder: (_, index) {
        final notif = notifications[index];
        return ListTile(
          leading: Icon(
            Icons.notifications,
            color: notif["unread"] as bool
                ? (isDarkMode ? Colors.white : Colors.black)
                : Colors.grey,
          ),
          title: Text(
            notif["title"] as String,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: notif["unread"] as bool
                  ? (isDarkMode ? Colors.white : Colors.black)
                  : Colors.grey,
            ),
          ),
          subtitle: Text(
            notif["subtitle"] as String,
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                notif["time"] as String,
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              if (notif["unread"] as bool)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Baru",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}