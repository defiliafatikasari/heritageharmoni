import 'package:flutter/material.dart';

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // =============== HEADER PROFIL =================
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

            // ============ MENU PROFIL =============
            _buildSectionTitle("Profil Pengguna"),
            _buildMenuItem(Icons.person, "Edit Profil"),
            _buildMenuItem(Icons.lock, "Ubah Password"),
            _buildMenuItem(Icons.logout, "Logout", isLogout: true),

            const SizedBox(height: 20),

            // ============= LAYANAN =============
            _buildSectionTitle("Layanan"),
            _buildMenuItem(Icons.support_agent, "Hubungi Dukungan"),
            _buildMenuItem(Icons.emoji_events, "Penghargaan"),
            _buildMenuItem(Icons.camera_alt, "Media Sosial"),

            const SizedBox(height: 20),

            // ============= BAGIKAN & BOOKMARK =============
            _buildSectionTitle("Bagikan & Bookmark"),
            _buildMenuItem(Icons.share, "Bagikan Konten"),
            _buildMenuItem(Icons.bookmark, "Bookmark"),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ===== TITLE SECTION =====
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

  // ===== MENU ITEM =====
  Widget _buildMenuItem(IconData icon, String label, {bool isLogout = false}) {
    return InkWell(
      onTap: () {},
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
}
