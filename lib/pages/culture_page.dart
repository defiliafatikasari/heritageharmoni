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
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ================== Banner ==================
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage('assets/images/heritage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
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
          ),

          const SizedBox(height: 24),

          // ================== Judul ==================
          const Text(
            "Eksplor Budaya",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5D4037),
            ),
          ),
          const SizedBox(height: 12),

          // ================== Grid Menu ==================
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
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
      ),
    );
  }

  // ================== Widget Reusable ==================
  static Widget _buildMenuCard(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
