import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
	);
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
					labelSmall: TextStyle(
						fontFamily: "Roboto",
						fontSize: 15,
						color: Colors.black,
						fontWeight: FontWeight.w700
					),
					labelMedium: TextStyle(
						fontFamily: "Roboto",
						fontSize: 20,
						color: Colors.white,
						fontWeight: FontWeight.w700
					),
				),
      ),
			initialRoute: '/login',
			routes: {
				'/login': (context) => const Login(),
				'/register': (context) => const Register(),
			},
    );
  }
}
