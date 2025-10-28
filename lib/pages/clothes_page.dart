import 'package:flutter/material.dart';

class ClothesPage extends StatelessWidget {
  const ClothesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> clothes = [
      {
        "nama": "Ulos Batak",
        "desc":
            "Kain tenun khas Batak, Sumatera Utara yang digunakan dalam upacara adat.",
        "img":
            "https://www.shutterstock.com/image-vector/indonesian-traditional-kain-ulos-batak-260nw-2426948931.jpg"
      },
      {
        "nama": "Baju Bodo Bugis",
        "desc":
            "Pakaian adat wanita Bugis, Sulawesi Selatan, berbentuk sederhana namun anggun.",
        "img":
            "https://assets.pikiran-rakyat.com/crop/0x0:0x0/720x0/webp/photo/2024/09/04/3418023814.jpg"
      },
      {
        "nama": "Kebaya Jawa",
        "desc":
            "Busana adat Jawa yang identik dengan keanggunan dan kelembutan perempuan Jawa.",
        "img":
            "https://javanologi.uns.ac.id/wp-content/uploads/sites/26/2022/10/kebayaaaa.jpeg"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Pakaian Adat")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: clothes.length,
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
                  clothes[index]["img"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
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
                clothes[index]["nama"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(clothes[index]["desc"]!),
            ),
          );
        },
      ),
    );
  }
}
