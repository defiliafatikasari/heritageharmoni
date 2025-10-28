import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4E9),
      appBar: AppBar(
        title: const Text("Jelajahi Budaya"),
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
                decoration: InputDecoration(
                  hintText: "Cari acara / pameran...",
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

              // ===== PAMERAN =====
              const Text(
                "Pameran Budaya",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              _buildCultureCard(
                title: "Pameran Tenun Nusantara",
                location: "Museum Budaya Jakarta",
                date: "12 Jan - 28 Feb 2025",
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Exhibition_-_Fashion_Wear_using_woven_fabric_from_NTT_by_Norci_Nomleni.jpg/250px-Exhibition_-_Fashion_Wear_using_woven_fabric_from_NTT_by_Norci_Nomleni.jpg",
              ),
              _buildCultureCard(
                title: "Pameran Patung Kayu Tradisional",
                location: "Galeri Seni Bali",
                date: "5 Feb - 3 Mar 2025",
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/b/bd/Ana_deo_figures_Louvre_70-999-5-1-2.jpg",
              ),

              const SizedBox(height: 25),

              // ===== EVENT =====
              const Text(
                "Event & Festival",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              _buildCultureCard(
                title: "Festival Musik Tradisional",
                location: "Lapangan Kota Yogyakarta",
                date: "20 Feb 2025",
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Talempong_pacik2.jpg/500px-Talempong_pacik2.jpg",
              ),
              _buildCultureCard(
                title: "Parade Budaya Sunda",
                location: "Bandung",
                date: "3 Mar 2025",
                image:
                    "https://upload.wikimedia.org/wikipedia/commons/a/a2/Tradisi_Parebut_Seeng_Bogor.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== CARD WIDGET =====
  Widget _buildCultureCard({
    required String title,
    required String location,
    required String date,
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
            child: Image.network(
              image, // pakai network bukan asset
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
                  Text(location, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(date,
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
