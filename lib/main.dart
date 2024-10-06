import 'package:flutter/material.dart';
import 'package:flutter_api_integration_app/pages/pokemon_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFEF5350),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFEF5350),
          elevation: 0,
          titleTextStyle: GoogleFonts.pressStart2p(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.vt323(
            fontSize: 18,
            color: Colors.black87,
          ),
          bodyMedium: GoogleFonts.vt323(
            fontSize: 16,
            color: Colors.black54,
          ),
          displayLarge: GoogleFonts.pressStart2p(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shadowColor: Colors.black38,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFFCA28),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEF5350),
              Color(0xFFFFA726),
            ],
          ),
        ),
        child: const PokemonPage(),
      ),
    );
  }
}
