import 'package:doc_appoint/screens/splashscreen.dart';
import 'package:doc_appoint/screens/home_screen.dart';
import 'package:doc_appoint/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'DocAppoint',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          //  Still checking auth state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Splashscreen();
          }

          //  User already logged in → Go to HomeScreen
          if (snapshot.hasData) {
            return HomeScreen();
          }

          // No user logged in → Show LoginScreen
          return Login();
        },
      ),
    );
  }
}

