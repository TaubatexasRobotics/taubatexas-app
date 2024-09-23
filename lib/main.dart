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
				colorScheme: ColorScheme.fromSeed(
					seedColor: Colors.blue,
					brightness: Brightness.light,
					primary: Colors.blue[900],
					secondary: Colors.lightBlue,
				),
        useMaterial3: true,
				textTheme: TextTheme(
					bodyMedium: TextStyle(
						fontFamily: "Roboto",
					),
					titleLarge: TextStyle(
						fontFamily: "Bebas Neue",
						fontSize: 40,
					),
					labelMedium: TextStyle(
						fontFamily: "Roboto",
						fontSize: 20,
						color: Colors.white,
						fontWeight: FontWeight.w700
					),
				),
      ),
      home: const Login(),
    );
  }
}
