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
    "assets/images/restaurant.jpg",
    "assets/images/pop_up_remote_event.jpg",
    "assets/images/micro_market_frictionless_retail.jpg",
    "assets/images/kitchen.jpeg",
    "assets/images/delivery.jpg",
    "assets/images/cafe.jpg"
  ];
  List<List<Color>> buttonColors = [
    // [hovered, non hovered]
    [const Color(0xff2F3D8D), const Color(0xff6872AB)],
    [const Color(0xffD3741B), const Color(0xffDD9861)],
    [const Color(0xff96C33A), const Color(0xffB0D27F)],
    [const Color(0xff569999), const Color(0xff7BB2B3)],
    [const Color(0xff58247A), const Color(0xff8663A0)],
    [const Color(0xffC00078), const Color(0xffCB4E9C)]
  ];

  List<List<dynamic>> buttonColorState = List.filled(
      6, [false, ""]); // index-> [isSectionHovered, which label is hovered]

  String path = "assets/images/base.jpg";
  String basePath = "assets/images/base.jpg";

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
              buttonColorState[imageIndex] = [true, label];
              path = images[imageIndex];
            });
          },
          onExit: (_) {
            setState(() {
              buttonColorState[imageIndex] = [false, ""];
              path = basePath;
            });
          },
          child: SizedBox(
            height: 65,
            width: baseWidth / 16,
            child: Stack(
              children: [
                ClipPolygon(
                    sides: 5,
                    borderRadius: baseWidth / 240,
                    rotate: rotate ?? 0.0,
                    boxShadows: [
                      PolygonBoxShadow(
                          color: const Color(0xff000000), elevation: 1.0),
                      PolygonBoxShadow(
                          color: const Color(0xff808080), elevation: 2),
                    ],
                    child: Container(
                        color: buttonColorState[imageIndex][1] == label
                            ? buttonColors[imageIndex][0]
                            : (buttonColorState[imageIndex][0]
                                ? buttonColors[imageIndex][1]
                                : const Color(0xffC8C7C7)))),
                Positioned(
                  top: 15,
                  left: 15,
                  child: SizedBox(
                    width: baseWidth / 35,
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                      maxLines: 4,
                      softWrap: true,
                      // Enable text wrapping
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
    double baseHeight = min(MediaQuery.of(context).size.height * 0.9, 720);
    double baseWidth = min(MediaQuery.of(context).size.width * 0.9, 1200);

    return Center(
      child: Container(
        height: baseHeight,
        width: baseWidth,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff000000)),
          image: DecorationImage(
            image: AssetImage(basePath),
            fit: BoxFit.fitWidth,
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
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            //restaurant
            _buildButton("Counter collection", 0, baseWidth, baseHeight,
                bottom: baseHeight / 5.5, right: baseWidth / 7, rotate: 11),
            _buildButton("Menu display", 0, baseWidth, baseHeight,
                bottom: baseHeight / 7, right: baseWidth / 9.85, rotate: 335),
            _buildButton("Sell checkout kiosks", 0, baseWidth, baseHeight,
                top: baseHeight / 5, right: baseWidth / 100, rotate: 200),
            _buildButton(
                "Image recognition smart checkout", 0, baseWidth, baseHeight,
                top: baseHeight / 4.2, right: baseWidth / 20, rotate: 235),
            _buildButton("Tills", 0, baseWidth, baseHeight,
                top: baseHeight / 3.5, right: baseWidth / 90, rotate: 200),
            _buildButton(
                "Table service (QR code at table)", 0, baseWidth, baseHeight,
                top: baseHeight / 1.9, left: baseWidth / 1.068, rotate: 78),
            _buildButton("Mobile pre-order", 0, baseWidth, baseHeight,
                top: baseHeight / 1.85, right: baseWidth / 22, rotate: 115),
            _buildButton("Kiosk for ordering", 0, baseWidth, baseHeight,
                top: baseHeight / 2.15, right: baseWidth / 25, rotate: 80),

            //pop-up remote event
            _buildButton("QR code for ordering", 1, baseWidth, baseHeight,
                top: baseHeight / 35, left: baseWidth / 30, rotate: 10),
            _buildButton("Conference & events", 1, baseWidth, baseHeight,
                top: baseHeight / 16, left: baseWidth / 13, rotate: 335),

            //micro_market_frictionless_retail
            _buildButton("Scan & Go", 2, baseWidth, baseHeight,
                top: baseHeight / 35, right: baseWidth / 5, rotate: 10),
            _buildButton("Smart fridge & vending", 2, baseWidth, baseHeight,
                top: baseHeight / 16.5, right: baseWidth / 6.3, rotate: 335),
            _buildButton("Frictionless retail", 2, baseWidth, baseHeight,
                top: baseHeight / 16, right: baseWidth / 15, rotate: 10),
            _buildButton("Self serve checkout", 2, baseWidth, baseHeight,
                top: baseHeight / 11, right: baseWidth / 40, rotate: 335),

            //kitchen
            _buildButton("Dashboards", 3, baseWidth, baseHeight,
                top: baseHeight / 3.7, right: baseWidth / 2.5, rotate: 5),
            _buildButton("Kitchen management", 3, baseWidth, baseHeight,
                top: baseHeight / 3.35, right: baseWidth / 2.8, rotate: 330),
            _buildButton("Stock checks", 3, baseWidth, baseHeight,
                top: baseHeight / 3.7, left: baseWidth / 3, rotate: 5),
            _buildButton("Safety works", 3, baseWidth, baseHeight,
                top: baseHeight / 3.4, left: baseWidth / 2.65, rotate: 330),
            _buildButton("Ghost kitchen", 3, baseWidth, baseHeight,
                top: baseHeight / 3.8, left: baseWidth / 2.38, rotate: 5),

            //delivery
            _buildButton("Meeting & informal events", 4, baseWidth, baseHeight,
                top: baseHeight / 1.15, left: baseWidth / 4.8, rotate: 8),
            _buildButton("On premise delivery", 4, baseWidth, baseHeight,
                bottom: baseHeight / 5, right: baseWidth / 2.95, rotate: 18),
            _buildButton("Mobile orderings", 4, baseWidth, baseHeight,
                bottom: baseHeight / 30, right: baseWidth / 2.65, rotate: 42),
            _buildButton("Food lockers", 4, baseWidth, baseHeight,
                bottom: baseHeight / 20, right: baseWidth / 3, rotate: 5),

            //cafe
            _buildButton("Kiosk for ordering", 5, baseWidth, baseHeight,
                bottom: baseHeight / 4.8, right: baseWidth / 1.18, rotate: 190),
            _buildButton(
                "Table service(QR code at table)", 5, baseWidth, baseHeight,
                top: baseHeight / 2.2, left: baseWidth / 3.35, rotate: 190),
            _buildButton("Order status display", 5, baseWidth, baseHeight,
                top: baseHeight / 1.635, left: baseWidth / 3.90, rotate: 31),
            _buildButton("Rewards & promotions", 5, baseWidth, baseHeight,
                top: baseHeight / 1.72, left: baseWidth / 3.35, rotate: 355),
            _buildButton("Digital signage", 5, baseWidth, baseHeight,
                top: baseHeight / 5, left: baseWidth / 100, rotate: 20),
            _buildButton("Mobile for ordering", 5, baseWidth, baseHeight,
                top: baseHeight / 4.2, left: baseWidth / 20, rotate: 55),
            _buildButton("Digital menus", 5, baseWidth, baseHeight,
                top: baseHeight / 3.5, left: baseWidth / 90, rotate: 20),
          ],
        ),
      ),
    );
  }
}
