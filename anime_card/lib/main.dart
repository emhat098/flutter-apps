import 'dart:async';
import 'dart:math';
import 'package:anime_card/src/widgets/shape_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(brightness: Brightness.light),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _width = 300;
  double _height = 300 * 16 / 9;
  Timer? _timer;
  Color _color = Colors.white.withOpacity(0.1);
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(10);
  Icon _iconFloatButton = const Icon(Icons.play_arrow_outlined);
  bool _isPlaying = false;
  String _imageNetworkUrl = 'https://picsum.photos/1080';

  void randomShapePressed() {
    if (_isPlaying) {
      cancelRandom();
    } else {
      startRandomShapeTimer();
    }
    toggleFloatIcon();
  }

  void startRandomShapeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        randomShape();
      });
    });
    _isPlaying = true;
  }

  void cancelRandom() {
    _timer!.cancel();
    _isPlaying = false;
    _timer = null;
  }

  void toggleFloatIcon() {
    setState(() {
      if (_timer != null && _timer!.isActive) {
        _iconFloatButton = const Icon(Icons.pause_circle_outline_sharp);
      } else {
        _iconFloatButton = const Icon(Icons.play_arrow_outlined);
      }
    });
  }

  void randomShape() {
    final random = Random();
    _width = random.nextInt(300) + 100.toDouble();
    _height = random.nextInt(300) + 100.toDouble();
    _color = Color.fromARGB(random.nextInt(256), random.nextInt(256),
            random.nextInt(256), random.nextInt(256))
        .withOpacity(0.1);
    _borderRadiusGeometry =
        BorderRadius.circular(random.nextInt(5) + 10.toDouble());
    _imageNetworkUrl = 'https://picsum.photos/${random.nextInt(1000) + 1000}';
  }

  @override
  void dispose() {
    cancelRandom();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShapeImage(
            width: _width,
            height: _height,
            color: _color,
            borderRadiusGeometry: _borderRadiusGeometry,
            imageNetworkUrl: _imageNetworkUrl),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: randomShapePressed,
        backgroundColor: Colors.white,
        hoverColor: Colors.black26,
        child: _iconFloatButton,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
