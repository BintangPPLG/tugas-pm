import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.name = 'Nama Pengguna',
    this.subtitle = 'Bio singkat pengguna',
    this.avatarUrl,
  });

  final String name;
  final String subtitle;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Kartu profil (foto + nama + bio)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage:
                              avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                          child: avatarUrl == null
                              ? const Icon(Icons.person, size: 36, color: Colors.white)
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Text(subtitle,
                                  style: TextStyle(
                                      color: Colors.grey.shade700, fontSize: 14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 1),
                    const SizedBox(height: 12),
                    // Baris 3 ikon (sesuai gambar)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _QuickAction(icon: Icons.settings, label: 'Setting'),
                        _QuickAction(icon: Icons.message, label: 'Message'),
                        _QuickAction(icon: Icons.favorite, label: 'Favorite'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // List item (avatar kecil + teks) — bisa kamu ganti sesuai kebutuhan
            const _ProfileListItem(icon: Icons.account_circle, title: 'Akun Saya'),
            const _ProfileListItem(icon: Icons.payment, title: 'Metode Pembayaran'),
            const _ProfileListItem(icon: Icons.location_on, title: 'Alamat'),
            const _ProfileListItem(icon: Icons.help_outline, title: 'Pusat Bantuan'),
            const _ProfileListItem(icon: Icons.logout, title: 'Keluar'),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon, size: 28)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
    }
}

class _ProfileListItem extends StatelessWidget {
  const _ProfileListItem({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black87),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
