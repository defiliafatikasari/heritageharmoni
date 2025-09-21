import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Musik Tradisional"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "Musik Tradisional Indonesia",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "Indonesia kaya dengan berbagai alat musik tradisional seperti gamelan, angklung, sasando, "
            "dan kolintang. Musik tradisional ini merupakan warisan budaya yang perlu dilestarikan.",
          ),
        ],
      ),
    );
  }
}
