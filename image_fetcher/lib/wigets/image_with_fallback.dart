import 'package:flutter/material.dart';
import 'package:image_fetcher/router/image_review.dart';

class ImageWithFallback extends StatelessWidget {
  final String imageUri;
  final String imageAlt;

  const ImageWithFallback(
      {super.key, required this.imageUri, this.imageAlt = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUri),
          const Padding(padding: EdgeInsets.all(10)),
          Text(imageAlt),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageReviewScreen(
                                  imageUrl: imageUri,
                                  imageAlt: imageAlt,
                                )))
                  },
              style: const ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                    TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                alignment: Alignment.center,
                foregroundColor:
                    MaterialStatePropertyAll(Color.fromRGBO(0, 0, 0, 1)),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                animationDuration: Duration(milliseconds: 3000),
                padding:
                    MaterialStatePropertyAll(EdgeInsets.fromLTRB(12, 4, 12, 4)),
                shadowColor: MaterialStatePropertyAll(Colors.black87),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              child: const Text('Click for review'))
        ],
      ),
    );
  }
}
