import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const EcoChangeApp());
}

class EcoChangeApp extends StatelessWidget {
  const EcoChangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

