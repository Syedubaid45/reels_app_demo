import 'package:flutter/material.dart';
import 'package:reels_app_demo/firebase_options.dart';
import 'package:reels_app_demo/reels/reels_view.dart';
import 'package:reels_app_demo/screens/Welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // only if using flutterfire CLI
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ReelsView());
  }
}
