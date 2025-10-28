import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foods = [
      {
        "nama": "Rendang",
        "desc":
            "Masakan khas Minangkabau yang mendunia, berbahan dasar daging sapi dengan bumbu rempah.",
        "img":
            "https://asset.kompas.com/crops/QsUYn6p5xK4DsivCrxa0_TXdjuk=/10x36:890x623/1200x800/data/photo/2023/03/25/641e5ef63dea4.jpg"
      },
      {
        "nama": "Gudeg",
        "desc":
            "Makanan khas Yogyakarta berbahan nangka muda yang dimasak dengan santan.",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Nasi_Gudeg.jpg/1200px-Nasi_Gudeg.jpg"
      },
      {
        "nama": "Pempek",
        "desc":
            "Kuliner khas Palembang berbahan dasar ikan dan sagu, disajikan dengan cuko.",
        "img":
            "https://assets.pikiran-rakyat.com/crop/0x120:1200x1008/720x0/webp/photo/2025/02/01/3486267815.jpeg"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Kuliner Daerah")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  foods[index]["img"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Kalau gambar gagal dimuat
                    return Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              title: Text(
                foods[index]["nama"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(foods[index]["desc"]!),
            ),
          );
        },
      ),
    );
  }
}
