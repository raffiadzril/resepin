import 'package:flutter/material.dart';

class KomunitasTab extends StatelessWidget {
  const KomunitasTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const Text('Seminggu terakhir', style: TextStyle(fontWeight: FontWeight.bold)),
        _komunitasItem(
          title: 'Diskusi Baru: Tips Memasak Sehat',
          subtitle: 'Lihat topik diskusi terbaru dari Komunitas Sehat!',
          time: '10.30',
          unread: true,
        ),
        _komunitasItem(
          title: 'Komentar Baru di Resepmu',
          subtitle: 'Ayu: "Terima kasih, resepnya enak banget!"',
          time: '09.45',
          unread: true,
        ),
        _komunitasItem(
          title: 'Event Komunitas: Masak Bareng!',
          subtitle: 'Gabung event masak virtual Sabtu ini, jam 5 sore.',
          time: '08.20',
          unread: true,
        ),
        _komunitasItem(
          title: 'Resep Favoritmu Di-like',
          subtitle: '20 orang menyukai resep “Nasi Goreng Spesial” milikmu.',
          time: 'Kemarin',
          unread: true,
        ),
        _komunitasItem(
          title: 'Pengguna Baru Bergabung',
          subtitle: 'Sapa pengguna baru di komunitas: Dita, Budi, dan Andi.',
          time: 'Kemarin',
          unread: true,
        ),
        const SizedBox(height: 16),
        const Text('Sebulan terakhir', style: TextStyle(fontWeight: FontWeight.bold)),
        _komunitasItem(
          title: 'Voting Resep Favorit Telah Dibuka',
          subtitle: 'Pilih resep favoritmu bulan ini dan menangkan hadiah menarik!',
          time: '2 minggu lalu',
          unread: false,
        ),
        _komunitasItem(
          title: 'Perubahan Aturan Komunitas',
          subtitle: 'Baca pembaruan kebijakan komunitas yang mulai berlaku hari ini.',
          time: '3 minggu lalu',
          unread: false,
        ),
        _komunitasItem(
          title: 'Selamat! Kamu Dapat Lencana Baru',
          subtitle: 'Kamu telah mencapai level “Master Resep”! 🎉',
          time: '4 minggu lalu',
          unread: false,
        ),
      ],
    );
  }

  Widget _komunitasItem({
    required String title,
    required String subtitle,
    required String time,
    required bool unread,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontSize: 12)),
          if (unread)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text("Unread", style: TextStyle(fontSize: 10, color: Colors.white)),
            ),
        ],
      ),
    );
  }
}
