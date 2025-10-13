import 'package:doctor_hunt/view/pages/home/home_page.dart';
import 'package:doctor_hunt/view/pages/onboarding/onboarding_page.dart';
import 'package:doctor_hunt/view/pages/find_doctor/find_doctor_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Hunt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: OnboardingPage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        FindDoctorPage.routeName: (context) => const FindDoctorPage(),
      },
    );
  }
}
