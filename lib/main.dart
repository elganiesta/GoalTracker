import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trackerApp/sign_in.dart';
import 'package:trackerApp/sign_up.dart';
import 'package:trackerApp/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goal Tracker',
      theme: ThemeData(
        primaryColor: Color(0xff1FCC79),
        accentColor: Colors.grey,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/signin': (context) => SignIn(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}
