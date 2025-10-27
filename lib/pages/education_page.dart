import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4E9),
      appBar: AppBar(
        title: const Text("Edukasi Budaya"),
        backgroundColor: const Color(0xFFCBAD86),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ===== SEARCH BAR =====
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari materi / kursus...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===== MATERI EDUKASI =====
              const Text(
                "Materi Edukasi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              _buildEduCard(
                title: "Sejarah Batik Nusantara",
                type: "Artikel & Infografis",
                image: "assets/images/heritage.png",
              ),
              _buildEduCard(
                title: "Video Pembuatan Wayang Kulit",
                type: "Video Pembelajaran",
                image: "assets/images/heritage.png",
              ),
              _buildEduCard(
                title: "E-book Tarian Tradisional",
                type: "E-book Budaya",
                image: "assets/images/heritage.png",
              ),

              const SizedBox(height: 28),

              // ===== PELATIHAN & KURSUS =====
              const Text(
                "Pelatihan & Kursus",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              _buildEduCard(
                title: "Kelas Melukis Motif Batik",
                type: "Workshop Offline",
                image: "assets/images/heritage.png",
              ),
              _buildEduCard(
                title: "Kursus Musik Tradisional Online",
                type: "Course Online",
                image: "assets/images/heritage.png",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== REUSABLE CARD =====
  Widget _buildEduCard({
    required String title,
    required String type,
    required String image,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14), bottomLeft: Radius.circular(14)),
            child: Image.asset(
              image,
              width: 110,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(type,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
