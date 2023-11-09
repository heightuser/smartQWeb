import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String path = "assets/images/spider.png";
  String basePath = "assets/images/spider.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: min(MediaQuery.of(context).size.height * 0.9, 800),
          width: min(MediaQuery.of(context).size.width * 0.9, 1200),
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
                height: min(MediaQuery.of(context).size.height * 0.9, 800),
                width: min(MediaQuery.of(context).size.width * 0.9, 1200),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 200,
                  left: 200,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipPolygon(
                      sides: 6,
                      borderRadius: 5.0,
                      rotate: 90.0,
                      boxShadows: [
                        PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                        PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
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
                  top: 200,
                  right: 200,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipPolygon(
                      sides: 6,
                      borderRadius: 5.0,
                      rotate: 90.0,
                      boxShadows: [
                        PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                        PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
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
                  // bottom: 500,
                  // right: 500,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipPolygon(
                        sides: 6,
                        borderRadius: 5.0,
                        rotate: 90.0,
                        boxShadows: [
                          PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                          PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
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
                  bottom: 200,
                  left: 200,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipPolygon(
                      sides: 6,
                      borderRadius: 5.0,
                      rotate: 90.0,
                      boxShadows: [
                        PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                        PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
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
                  bottom: 200,
                  right: 200,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipPolygon(
                      sides: 6,
                      borderRadius: 5.0,
                      rotate: 90.0,
                      boxShadows: [
                        PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                        PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
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
      ),
    );
  }
}
