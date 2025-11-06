import 'package:flutter/material.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
              children: [
                Image.asset("assets/images/heritage.png", height: 90),
                const SizedBox(height: 20),

                const Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                const TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: UnderlineInputBorder(),
                      hintText: "Email Anda"),
                ),

                const SizedBox(height: 20),

                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password Baru", border: UnderlineInputBorder()),
                ),

                const SizedBox(height: 20),

                const TextField(
                  obscureText: true,
                  decoration:
                      InputDecoration(labelText: "Ulangi Password Baru", border: UnderlineInputBorder()),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: const Text("Reset Password", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
