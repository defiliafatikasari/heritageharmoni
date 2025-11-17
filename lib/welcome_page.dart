import 'package:flutter/material.dart';
import 'pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double scale = width > 600 ? 1.6 : 1.0;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1CC80), Color(0xFFCBAD86)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/heritagehomescreen.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Image.asset(
                        "assets/images/heritage.png",
                        height: width > 600 ? 180 : 100, 
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Selamat Datang di\nHeritage Harmoni",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20 * scale,          
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "- Melestarikan Warisan Budaya -",
              style: TextStyle(
                fontSize: 16 * scale,        
                color: Colors.black54,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: width > 600 ? 22 : 14,
                  ),
                  minimumSize: Size(double.infinity, width > 600 ? 80 : 60),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: Text(
                  "Mulai",
                  style: TextStyle(
                    fontSize: 18 * scale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
