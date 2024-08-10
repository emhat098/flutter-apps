import 'package:campus_place/src/wigets/title_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Props shop"),
        ),
        body: const Center(
            child:
                TitleSection(name: 'Product1', location: 'Ho Chi Minh City')),
      ),
    );
  }
}
