import 'package:flutter/material.dart';
import 'package:reels_app_demo/screens/Login_screen.dart';
import 'package:reels_app_demo/widgets/custom_wave_clipper.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(color: Colors.deepOrangeAccent, height: 350),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(color: Colors.deepOrangeAccent, height: 320),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Reels App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your one-stop destination for all the latest reels.",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Icon(
          Icons.arrow_circle_right_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
