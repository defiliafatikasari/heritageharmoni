import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foods = [
      {
        "nama": "Rendang",
        "desc": "Masakan khas Minangkabau yang mendunia, berbahan dasar daging sapi dengan bumbu rempah.",
        "img": "assets/images/heritage.png"
      },
      {
        "nama": "Gudeg",
        "desc": "Makanan khas Yogyakarta berbahan nangka muda yang dimasak dengan santan.",
        "img": "assets/images/heritage.png"
      },
      {
        "nama": "Pempek",
        "desc": "Kuliner khas Palembang berbahan dasar ikan dan sagu, disajikan dengan cuko.",
        "img": "assets/images/heritage.png"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Kuliner Daerah")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(foods[index]["img"]!, width: 60, fit: BoxFit.cover),
              ),
              title: Text(foods[index]["nama"]!),
              subtitle: Text(foods[index]["desc"]!),
            ),
          );
        },
      ),
    );
  }
}
