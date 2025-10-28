import 'package:flutter/material.dart';

class FestivalPage extends StatelessWidget {
  const FestivalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> festivals = [
      {
        "nama": "Bali Arts Festival",
        "desc":
            "Festival seni tahunan di Bali yang menampilkan tari, musik, dan kerajinan tradisional.",
        "img":
            "https://cdn.antaranews.com/cache/1200x800/2016/06/20160613123.jpg"
      },
      {
        "nama": "Sekaten Yogyakarta",
        "desc":
            "Perayaan tradisional di Yogyakarta untuk memperingati Maulid Nabi Muhammad SAW.",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/c/c9/Gunungan_darat_during_Garebeg_Mulud_Yogyakarta_Dec_2017_Pj_IMG_4517sm.jpg"
      },
      {
        "nama": "Tabuik Pariaman",
        "desc":
            "Tradisi di Sumatera Barat untuk memperingati hari Asyura dalam budaya Minangkabau.",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/8/89/Tabuik_festival.jpg"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Festival & Tari")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: festivals.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  festivals[index]["img"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey[300],
                      child:
                          const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              title: Text(
                festivals[index]["nama"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(festivals[index]["desc"]!),
            ),
          );
        },
      ),
    );
  }
}
