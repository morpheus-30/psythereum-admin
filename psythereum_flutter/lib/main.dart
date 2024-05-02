import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psythereum/Screens/LandingScreen.dart';
import 'package:psythereum/Screens/MeetEndScreen.dart';
import 'package:psythereum/Screens/Patient/Dashboard.dart';
import 'package:psythereum/Screens/Psychiatrist/Dashboard.dart';
import 'package:psythereum/Screens/Researcher/Dashboard.dart';
import 'package:psythereum/Screens/Researcher/SavedSessionsScreen.dart';
import 'package:psythereum/Screens/SignupScreen.dart';
import 'package:psythereum/firebase_options.dart';
import 'package:sizer/sizer.dart';

void main() async{
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
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) =>LandingScreen(),
            '/saved-sessions': (context) => SavedSessions(),
            '/redirect-session-over': (context) => MeetEndScreen(),
          },
        );
      },
    );
  }
}
