import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class CustomComponent extends StatefulWidget {
  const CustomComponent({Key? key}) : super(key: key);

  @override
  _CustomComponentState createState() => _CustomComponentState();
}

class _CustomComponentState extends State<CustomComponent> {
  String path = "assets/images/spider.png";
  String basePath = "assets/images/spider.png";
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
            image: AssetImage(basePath),
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
            Positioned(
                top: baseHeight/4,
                left: baseWidth/6,
                child: SizedBox(
                  height: 100,
                  width: baseWidth/12,
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: 5,
                    rotate: 90.0,
                    boxShadows: [
                      PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                      PolygonBoxShadow(color: Colors.grey, elevation: 5)
                    ],
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Flower"),
                      onHover: (bool isHovered) {
                        if (isHovered) {
                          setState(() {
                            path = "assets/images/flower.jpg";
                          });
                        } else {
                          setState(() {
                            path = "assets/images/spider.png";
                          });
                        }
                      },
                    ),
                  ),
                )),
            Positioned(
                top: baseHeight/4,
                right: baseWidth/6,
                child: SizedBox(
                  height: 100,
                  width: baseWidth/12,
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: 5,
                    rotate: 90.0,
                    boxShadows: [
                      PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                      PolygonBoxShadow(color: Colors.grey, elevation: 5)
                    ],
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Girl"),
                      onHover: (bool isHovered) {
                        if (isHovered) {
                          setState(() {
                            path = "assets/images/girl.JPG";
                          });
                        } else {
                          setState(() {
                            path = "assets/images/spider.png";
                          });
                        }
                      },
                    ),
                  ),
                )),
            Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 100,
                    width: baseWidth/12,
                    child: ClipPolygon(
                      sides: 6,
                      borderRadius: 5,
                      rotate: 90.0,
                      boxShadows: [
                        PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                        PolygonBoxShadow(color: Colors.grey, elevation: 5)
                      ],
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text("Night"),
                        onHover: (bool isHovered) {
                          if (isHovered) {
                            setState(() {
                              path = "assets/images/night.jpg";
                            });
                          } else {
                            setState(() {
                              path = "assets/images/spider.png";
                            });
                          }
                        },
                      ),
                    ),
                  ),
                )),
            Positioned(
                bottom: baseHeight/4,
                left: baseWidth/6,
                child: SizedBox(
                  height: 100,
                  width: baseWidth/12,
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: 5,
                    rotate: 90.0,
                    boxShadows: [
                      PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                      PolygonBoxShadow(color: Colors.grey, elevation: 5)
                    ],
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Spiral"),
                      onHover: (bool isHovered) {
                        if (isHovered) {
                          setState(() {
                            path = "assets/images/spiral.jpg";
                          });
                        } else {
                          setState(() {
                            path = "assets/images/spider.png";
                          });
                        }
                      },
                    ),
                  ),
                )),
            Positioned(
                bottom: baseHeight/4,
                right: baseWidth/6,
                child: SizedBox(
                  height: 100,
                  width: baseWidth/12,
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: baseWidth/240,
                    rotate: 90.0,
                    boxShadows: [
                      PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                      PolygonBoxShadow(color: Colors.grey, elevation: 5)
                    ],
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Sky"),
                      onHover: (bool isHovered) {
                        if (isHovered) {
                          setState(() {
                            path = "assets/images/sky.jpg";
                          });
                        } else {
                          setState(() {
                            path = "assets/images/spider.png";
                          });
                        }
                      },
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
