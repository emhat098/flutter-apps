import 'package:flutter/material.dart';

class ImageReviewScreen extends StatelessWidget {
  final String imageUrl;
  final String imageAlt;

  const ImageReviewScreen(
      {super.key, required this.imageUrl, this.imageAlt = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          imageAlt,
          style: const TextStyle(fontSize: 13),
        ),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
