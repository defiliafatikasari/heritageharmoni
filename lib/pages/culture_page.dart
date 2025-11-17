import 'package:flutter/material.dart';
import 'package:heritage_apps/pages/festival_page.dart';
import 'package:heritage_apps/pages/music_page.dart';
import 'package:heritage_apps/pages/food_page.dart';
import 'package:heritage_apps/pages/clothes_page.dart';

// ================== Halaman Budaya ==================
class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budaya Indonesia"),
        centerTitle: true,
        backgroundColor: const Color(0xFFCBAD86),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      // ================== Body ==================
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          // jumlah kolom responsif
          int crossAxisCount = width > 900
              ? 4
              : width > 600
                  ? 3
                  : 2;

          // perbandingan tinggi-lebar card
          double aspectRatio = width > 900
              ? 1.1
              : width > 600
                  ? 1.0
                  : 0.85;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
            // ================== Banner ==================
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: width > 900
                    ? 4.0     // Laptop
                    : width > 600
                        ? 3.8 // Tablet
                        : 3.0, // HP
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/benner/Benner2.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                ),

                    // gradient + text overlay
                    Container(
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.bottomLeft,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: const Text(
                        "Lestarikan Budaya Indonesia",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

              const SizedBox(height: 24),

              const Text(
                "Eksplor Budaya",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),
              const SizedBox(height: 12),

              // ================== Grid ==================
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: aspectRatio,
                ),
                children: [
                  _buildMenuCard(
                    context,
                    Icons.music_note,
                    "Musik Tradisional",
                    const MusicPage(),
                  ),
                  _buildMenuCard(
                    context,
                    Icons.dinner_dining,
                    "Kuliner Daerah",
                    const FoodPage(),
                  ),
                  _buildMenuCard(
                    context,
                    Icons.style,
                    "Pakaian Adat",
                    const ClothesPage(),
                  ),
                  _buildMenuCard(
                    context,
                    Icons.festival,
                    "Festival & Tari",
                    const FestivalPage(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  // ================== Widget Card ==================
static Widget _buildMenuCard(
    BuildContext context, IconData icon, String title, Widget page) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 3,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE1CC80), Color(0xFFCBAD86)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 40, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}
