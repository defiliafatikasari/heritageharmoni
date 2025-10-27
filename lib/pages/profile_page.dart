import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4E9),
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: const Color(0xFFCBAD86),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 30),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/heritage.png"),
            ),
            const SizedBox(height: 12),
            const Text(
              "Nama Pengguna",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "email@gmail.com",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            _buildSectionTitle("Profil Pengguna"),
            _buildMenuItem(context, Icons.person, "Edit Profil"),
            _buildMenuItem(context, Icons.lock, "Ubah Password"),
            _buildMenuItem(context, Icons.logout, "Logout", isLogout: true),

            const SizedBox(height: 20),

            _buildSectionTitle("Layanan"),
            _buildMenuItem(context, Icons.support_agent, "Hubungi Dukungan"),
            _buildMenuItem(context, Icons.emoji_events, "Penghargaan"),
            _buildMenuItem(context, Icons.camera_alt, "Media Sosial"),

            const SizedBox(height: 20),

            _buildSectionTitle("Bagikan & Bookmark"),
            _buildMenuItem(context, Icons.share, "Bagikan Konten"),
            _buildMenuItem(context, Icons.bookmark, "Bookmark"),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ========== SECTION TITLE ==========
  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  // ========== MENU ITEM ==========
  Widget _buildMenuItem(BuildContext context, IconData icon, String label, {bool isLogout = false}) {
    return InkWell(
      onTap: () {
        if (isLogout) {
          _showLogoutDialog(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isLogout ? Colors.red : Colors.black87),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: isLogout ? Colors.red : Colors.black87,
                fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black38),
          ],
        ),
      ),
    );
  }

  // ========== LOGOUT DIALOG ==========
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Konfirmasi Logout"),
          content: const Text("Apakah Anda yakin ingin keluar dari akun?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
