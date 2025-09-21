import 'package:flutter/material.dart';

class ClothesPage extends StatelessWidget {
  const ClothesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> clothes = [
      {
        "nama": "Ulos Batak",
        "desc": "Kain tenun khas Batak, Sumatera Utara yang digunakan dalam upacara adat.",
        "img": "assets/images/heritage.png"
      },
      {
        "nama": "Baju Bodo Bugis",
        "desc": "Pakaian adat wanita Bugis, Sulawesi Selatan, berbentuk sederhana namun anggun.",
        "img": "assets/images/heritage.png"
      },
      {
        "nama": "Kebaya Jawa",
        "desc": "Busana adat Jawa yang identik dengan keanggunan dan kelembutan perempuan Jawa.",
        "img": "assets/images/heritage.png"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Pakaian Adat")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(clothes[index]["img"]!, width: 60, fit: BoxFit.cover),
              ),
              title: Text(clothes[index]["nama"]!),
              subtitle: Text(clothes[index]["desc"]!),
            ),
          );
        },
      ),
    );
  }
}
