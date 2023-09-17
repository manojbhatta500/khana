import 'package:flutter/material.dart';
import 'package:khana/screens/tabscreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: Brightness.dark,
            background: Colors.white10.withOpacity(0.7)),
      ),
      home: Tabscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
