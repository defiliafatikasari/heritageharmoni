import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  String searchQuery = "";

  // ===== DATA LIST =====
  final List<Map<String, String>> materials = [
    {
      "title": "Sejarah Batik Nusantara",
      "type": "Artikel & Infografis",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Collectie_NMvWereldculturen%2C_RV-847-81%2C_Batikpatroon%2C_%27Parang_sawut%27%2C_voor_1891.jpg/1200px-Collectie_NMvWereldculturen%2C_RV-847-81%2C_Batikpatroon%2C_%27Parang_sawut%27%2C_voor_1891.jpg"
    },
    {
      "title": "Video Pembuatan Wayang Kulit",
      "type": "Video Pembelajaran",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/5/51/Gathotkaca-paraga.png"
    },
    {
      "title": "E-book Tarian Tradisional",
      "type": "E-book Budaya",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/8/82/Tari_topeng_cirebon.jpg"
    },
  ];

  final List<Map<String, String>> courses = [
    {
      "title": "Kelas Melukis Motif Batik - Pamekasan",
      "type": "Workshop Offline",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/a/ab/Kemeja_batik_tulis_lukis.jpg"
    },
    {
      "title": "Kursus Musik Tradisional Online - Yogyakarta",
      "type": "Course Online",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/7/7e/Traditional_indonesian_instruments04.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan pencarian
    final filteredMaterials = materials.where((item) {
      return item["title"]!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    final filteredCourses = courses.where((item) {
      return item["title"]!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4E9),
      appBar: AppBar(
        title: const Text("Edukasi Budaya"),
        backgroundColor: const Color(0xFFCBAD86),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== SEARCH BAR =====
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
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

              // Jika kosong
              if (filteredMaterials.isEmpty)
                const Text("Tidak ada materi ditemukan.",
                    style: TextStyle(color: Colors.black54)),

              // Jika ada
              ...filteredMaterials.map((item) => _buildEduCard(
                    title: item["title"]!,
                    type: item["type"]!,
                    image: item["image"]!,
                  )),

              const SizedBox(height: 28),

              // ===== PELATIHAN & KURSUS =====
              const Text(
                "Pelatihan & Kursus",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              if (filteredCourses.isEmpty)
                const Text("Tidak ada kursus ditemukan.",
                    style: TextStyle(color: Colors.black54)),

              ...filteredCourses.map((item) => _buildEduCard(
                    title: item["title"]!,
                    type: item["type"]!,
                    image: item["image"]!,
                  )),
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
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
            child: Image.network(
              image,
              width: 110,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 60),
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
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(type,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
