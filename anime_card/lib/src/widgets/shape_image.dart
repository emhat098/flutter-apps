import 'package:flutter/material.dart';

class ShapeImage extends StatelessWidget {
  const ShapeImage({
    super.key,
    required double width,
    required double height,
    required Color color,
    required BorderRadiusGeometry borderRadiusGeometry,
    required String imageNetworkUrl,
  })  : _width = width,
        _height = height,
        _color = color,
        _borderRadiusGeometry = borderRadiusGeometry,
        _imageNetworkUrl = imageNetworkUrl;

  final double _width;
  final double _height;
  final Color _color;
  final BorderRadiusGeometry _borderRadiusGeometry;
  final String _imageNetworkUrl;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadiusGeometry,
          border: Border.all(color: Colors.white),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                _imageNetworkUrl,
              ))),
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
