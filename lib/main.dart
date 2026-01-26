import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pet_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetProvider(),
      child: MaterialApp(
        title: 'Aiboo Terrarium',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
