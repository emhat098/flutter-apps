import 'package:flutter/material.dart';
import 'package:image_fetcher/models/photo.dart';
import 'package:image_fetcher/utils/fetcher.dart';
import 'package:image_fetcher/wigets/image_with_fallback.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Fetcher',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Image Fetcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<dynamic> getImage() async {
    final res = await Fetcher.getData('picsum.photos', 'id/2/info', true);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Image fetcher',
            style: TextStyle(fontSize: 13),
          ),
        ),
        body: FutureBuilder<dynamic>(
            future: getImage(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text(
                      'Failed by fetch image. Please check the connection!'),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child:
                      Text('Failed by fetch image. Error: ${snapshot.error}'),
                );
              }

              if (snapshot.hasData) {
                Map<String, dynamic> data = snapshot.data;
                final photo = Photo(
                    data['id'],
                    data['author'],
                    data['width'].toDouble(),
                    data['height'].toDouble(),
                    data['url'],
                    data['download_url']);

                return ImageWithFallback(
                    imageUri: photo.downloadUrl, imageAlt: photo.author);
              }

              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Something went wrong. No data available!')],
                ),
              );
            }));
  }
}
