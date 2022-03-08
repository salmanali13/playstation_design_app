// import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:playstation_design_app/Models/Console_Model.dart';
import 'package:playstation_design_app/theme.dart';

import '../Widgets/CustomPaintersWidgets.dart';
// import 'package:model_viewer/model_viewer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  double _position = 185;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..forward();

    _animation = Tween<double>(begin: 0, end: 195)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setValue(double dX) {
    setState(() {
      _position = dX;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("-----------------Widget is rebuild-----------------");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(61, 185, 234, 1),
              Color.fromRGBO(70, 116, 237, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: Column(
          children: [
            _build3dView(context),
            // Spacer(),
            _buildDetailsView(context),
          ],
        ),
      ),
    );
  }

// This builds and returns upper 3d view and content with
  Widget _build3dView(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
              child: CustomPaint(
                foregroundPainter: RadialLinesPainter(),
              ),
            ),
          ),
          Positioned(
              top: -110,
              right: -80,
              child: Container(
                height: 370,
                width: 370,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white10),
              )),
          Positioned(
            top: 270,
            height: 5,
            width: 60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color:
                          const ui.Color.fromARGB(75, 0, 0, 0).withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 10),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, ch) => Positioned(
              top: -20,
              child: Container(
                height: 300,
                color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 50),
                child: PhysicalModel(
                  color: Colors.transparent,
                  child: Cube(
                    onSceneCreated: (scene) {
                      scene.world.transform.setFrom(Matrix4.compose(
                          Vector3(0, -1.2,
                              -2.5), // These points change the position of the object
                          Quaternion.euler(
                              radians(_animation.value),
                              radians(0),
                              radians(
                                  0)), // These are used for rotation of object
                          Vector3(5, 5,
                              5))); // These points change the scale of the object
                      scene.world
                          .add(Object(fileName: "assets/ps5_object/PS5.obj"));
                      scene.camera.zoom = 3;
                      scene.camera.near = 0.5;
                      scene.world.lighting = true;
                      // scene.blendMode = BlendMode.color;
                      // scene.textureBlendMode = BlendMode.color;
                    },
                    interactive: false,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 310,
            height: 30,
            width: 300,
            child: CustomPaint(
              painter: OvalPainter(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            top: 330,
            left: _position,
            child: GestureDetector(
              // When the drag starts------
              onPanStart: (details) {
                // setState(() {
                setValue(details.globalPosition.dx);
                // _position = details.globalPosition.dx;
                // });
              },
              onPanUpdate: (details) {
                if (_position != details.globalPosition.dx) {
                  // setState(() {
                  setValue(details.globalPosition.dx);
                  // _position = details.globalPosition.dx;
                  // });
                } else {
                  return;
                }
              },
              onPanEnd: (details) {
                // setState(() {
                setValue(200);
                // _position = ui.Offset.zero.dx;
                // });
              },
              child: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: ui.Offset(2, 2)),
                      // BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_back, size: 8, color: Colors.black),
                    Icon(Icons.arrow_forward, size: 8, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsView(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: AppTheme.shadow,
                ),
                child: Container(
                    height: 20,
                    color: Colors.blue,
                    child: const Text(
                      "SSD",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.11,
              ),
              const Expanded(
                child: Text(
                  "Ultra Speed SSD",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
            ],
          ),
        ),
        const Text(
          "Maximize your play sessions with near instant load times for installed PS5 Games",
          softWrap: true,
        ),
        const SizedBox(height: 50),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
            boxShadow: AppTheme.shadow,
          ),
          child: Row(
            children: [
              const Text("\$ ", style: TextStyle(color: Colors.blue)),
              const Text("499",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              const Expanded(child: SizedBox()),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: ui.Color.fromARGB(104, 70, 93, 240),
                          blurRadius: 10,
                          offset: ui.Offset(4, 2),
                          spreadRadius: 1),
                    ],
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(96, 215, 236, 1),
                      Color.fromRGBO(70, 93, 240, 1)
                    ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Preorder",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint2 = ui.Paint()
      ..color = Colors.white
      ..style = ui.PaintingStyle.fill;

    var strokeColor = ui.Paint()
      ..color = Colors.blue
      ..style = ui.PaintingStyle.fill;

    var paint = ui.Paint()
      ..color = Colors.white
      ..shader = ui.Gradient.linear(
          ui.Offset(size.width, 0), ui.Offset(size.width, size.height), [
        Colors.white10,
        // Colors.white10,
        Colors.white,
      ])
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // This is the main oval shape with a gradient overlay of white and transparent white------
    canvas.drawOval(
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
        paint);
    // Left Side circle-------------------------------------------------
    canvas.drawCircle(ui.Offset(0, size.height / 2), 5, strokeColor);
    canvas.drawCircle(ui.Offset(0, size.height / 2), 3, paint2);
    // Right Side circle-------------------------------------------------
    canvas.drawCircle(ui.Offset(size.width, size.height / 2), 5, strokeColor);
    canvas.drawCircle(ui.Offset(size.width, size.height / 2), 3, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
