import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
				textTheme: TextTheme(
					bodyMedium: TextStyle(
						fontFamily: "Roboto",
					),
					titleLarge: TextStyle(
						fontFamily: "Bebas Neue",
						fontSize: 40,
					),
				),
      ),
      home: const Login(),
    );
  }
}
