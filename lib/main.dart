import 'package:flutter/material.dart';
import 'package:tokokita/ui/login_page.dart';
import 'ui/registrasi_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toko Kita",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

}
