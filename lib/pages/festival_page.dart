import 'package:flutter/material.dart';

class FestivalPage extends StatelessWidget {
  const FestivalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> festivals = [
      {
        "nama": "Bali Arts Festival",
        "desc": "Festival seni tahunan di Bali yang menampilkan tari, musik, dan kerajinan tradisional.",
        "img": "assets/images/heritage.png"
      },
      {
        "nama": "Sekaten Yogyakarta",
        "desc": "Perayaan tradisional di Yogyakarta untuk memperingati Maulid Nabi Muhammad SAW.",
        "img": "assets/images/heritage.png"
      },
      {
        "nama": "Tabuik Pariaman",
        "desc": "Tradisi di Sumatera Barat untuk memperingati hari Asyura dalam budaya Minangkabau.",
        "img": "assets/images/heritage.png"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Festival & Tari")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: festivals.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(festivals[index]["img"]!, width: 60, fit: BoxFit.cover),
              ),
              title: Text(festivals[index]["nama"]!),
              subtitle: Text(festivals[index]["desc"]!),
            ),
          );
        },
      ),
    );
  }
}
