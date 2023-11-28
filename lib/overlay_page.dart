import 'package:flutter/material.dart';

class ImageOverlayExample extends StatelessWidget {
  const ImageOverlayExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.blue, // You can adjust the color to control the overlay effect
        BlendMode.overlay,
      ),
      child: Image.asset('assets/images/image.jpg'),
    );
  }
}