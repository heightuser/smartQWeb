import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class CustomComponent extends StatefulWidget {
  const CustomComponent({Key? key}) : super(key: key);

  @override
  _CustomComponentState createState() => _CustomComponentState();
}

class _CustomComponentState extends State<CustomComponent> {
  List<String> images = [
    "assets/images/image1.jpeg",
    "assets/images/image2.jpeg",
    "assets/images/image3.jpeg",
    "assets/images/image4.jpeg",
    "assets/images/image5.jpeg",
    "assets/images/image6.jpeg"
  ];
  String path = "assets/images/Base.jpeg";
  String basePath = "assets/images/Base.jpeg";

  Widget _buildButton(
      String label, int imageIndex, double baseWidth, double baseHeight,
      {double? top, double? left, double? right, double? bottom}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: SizedBox(
        height: 100,
        width: baseWidth / 12,
        child: ClipPolygon(
          sides: 6,
          borderRadius: baseWidth / 240,
          rotate: 90.0,
          boxShadows: [
            PolygonBoxShadow(color: Colors.black, elevation: 1.0),
            PolygonBoxShadow(color: Colors.grey, elevation: 5),
          ],
          child: ElevatedButton(
            onPressed: () {},
            child: Text(label),
            onHover: (bool isHovered) {
              setState(() {
                path = isHovered ? images[imageIndex] : basePath;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseHeight = min(MediaQuery.of(context).size.height * 0.9, 800);
    double baseWidth = min(MediaQuery.of(context).size.width * 0.9, 1200);

    return Center(
      child: Container(
        height: baseHeight,
        width: baseWidth,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(images[0]),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: baseHeight,
              width: baseWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildButton("Flower", 0, baseWidth, baseHeight,
                top: baseHeight / 4, left: baseWidth / 6),
            _buildButton("Girl", 1, baseWidth, baseHeight,
                top: baseHeight / 4, right: baseWidth / 6),
            _buildButton("Night", 2, baseWidth, baseHeight)
                .align(Alignment.center),
            _buildButton("Spiral", 3, baseWidth, baseHeight,
                bottom: baseHeight / 4, left: baseWidth / 6),
            _buildButton("Sky", 4, baseWidth, baseHeight,
                bottom: baseHeight / 4, right: baseWidth / 6),
          ],
        ),
      ),
    );
  }
}

extension PositionedExtension on Widget {
  Widget align(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }
}
