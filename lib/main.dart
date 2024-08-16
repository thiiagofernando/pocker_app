import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pocker_app/firebase_options.dart';
import 'package:pocker_app/presentation/views/login_screen.dart';
import 'core/ioc/service_locator.dart';
import 'presentation/views/home_screen.dart';
import 'presentation/views/register_screen.dart';
import 'presentation/views/reset_password_screen.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planning Poker',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
        ),
        useMaterial3: false,
      ),
    );
  }
}
