import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1CC80), Color(0xFFCBAD86)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("assets/images/heritage.png", height: 90)),
                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    "Buat akun sekarang yuk!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 6),

                const Center(
                  child: Text(
                    "Ayo buat akun HeritageHarmoni agar kamu bisa menggunakan fitur lengkap "
                    "kami dan mendapatkan update informasi terbaru.",
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                const TextField(
                  decoration: InputDecoration(labelText: "Username"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Ulangi Password"),
                ),
                const SizedBox(height: 12),

                const Text(
                  "Dengan Melanjutkan, Anda Menyetujui Ketentuan Layanan Dan Kebijakan Privasi Kami.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Daftar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol Register dengan Google & Facebook
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Icon
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red, size: 32),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    // Facebook Icon
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 32),
                      onPressed: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
