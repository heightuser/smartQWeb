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
    "assets/images/restaurant.jpeg",
    "assets/images/pop_up_remote_event.jpeg",
    "assets/images/micro_market_frictionless_retail.jpeg",
    "assets/images/kitchen.jpeg",
    "assets/images/delivery.jpeg",
    "assets/images/cafe.jpeg"
  ];
  List<Color> buttonColors = List.filled(6, Colors.purpleAccent);
  String path = "assets/images/base.jpeg";
  String basePath = "assets/images/base.jpeg";

  Widget _buildButton(
      String label, int imageIndex, double baseWidth, double baseHeight,
      {double? top,
      double? left,
      double? right,
      double? bottom,
      double? rotate}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: InkWell(
        onTap: () {},
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() {
              buttonColors[imageIndex] = Colors.purple;
              path = images[imageIndex];
            });
          },
          onExit: (_) {
            setState(() {
              buttonColors[imageIndex] = Colors.purpleAccent;
              path = basePath;
            });
          },
          child: Container(
            height: 65,
            width: baseWidth / 16,
            child: Stack(
              children: [
                ClipPolygon(
                  sides: 5,
                  borderRadius: baseWidth / 240,
                  rotate: rotate ?? 0.0,
                  boxShadows: [
                    PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                    PolygonBoxShadow(color: Colors.grey, elevation: 2),
                  ],
                  child: Container(color: buttonColors[imageIndex]),
                ),
                Positioned(
                  top: 14,
                  left: 15,
                  child: SizedBox(
                    width: baseWidth / 35,
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 4,
                      softWrap: true, // Enable text wrapping
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
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
          border: Border.all(color: Colors.black),
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
            _buildButton("QR code for ordering", 1, baseWidth, baseHeight,
                top: baseHeight / 35, left: baseWidth / 30, rotate: 10),
            _buildButton("Conference & Events", 1, baseWidth, baseHeight,
                top: baseHeight / 16, left: baseWidth / 13, rotate: 335),
            _buildButton("Klosk for ordering", 5,baseWidth, baseHeight,
              bottom: baseHeight / 5.5, right: baseWidth / 1.165, rotate: 190),
            _buildButton("Meeting & informal events", 4, baseWidth, baseHeight,
                top: baseHeight / 1.105, left: baseWidth / 4.7, rotate: 8),
            _buildButton("Table service (QR code at table)", 5, baseWidth, baseHeight,
                top: baseHeight / 2.2, left: baseWidth / 3.5, rotate: 190),
            _buildButton("On premise delivery", 4, baseWidth, baseHeight,
                bottom: baseHeight / 5.5, right: baseWidth / 3, rotate: 18),
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
