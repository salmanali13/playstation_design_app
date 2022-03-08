import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'CustomPaintersWidgets.dart';
import 'package:playstation_design_app/Models/Console_Model.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ConsoleModel> fetchedData = DemoConsoles.consoleList;
  @override
  void initState() {
    super.initState();

    ctrl.addListener(() {
      int pos = ctrl.page!.round();
      if (currentPage != pos) {
        {
          setState(() {
            currentPage = pos;
          });
        }
      }
    });
  }

  final PageController ctrl = PageController(
    viewportFraction: 0.7,
  );
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        padEnds: false,
        controller: ctrl,
        itemCount: 8,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, int index) {
          // Active page
          bool active = index == currentPage;
          ctrl.addListener(() {
            int pos = ctrl.page!.round();
            if (currentPage != pos) {
              {
                setState(() {
                  currentPage = pos;
                });
              }
            }
          });
          return _buildStoryPage(active, index);
        });
  }

// This returns A single page Item-----------------
  Widget _buildStoryPage(bool active, int i) {
    // final double blur = active ? 30 : 0;
    final double opacity = active ? 1 : 0.6;
    // final double offsetx = active ? 20 : 0;
    // final double offsety = active ? 20 : 0;
//   final double top = active ? 100 : 200;

    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed("Product-Detail-Screen/route"),
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: AnimatedContainer(
            // height: 100,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutQuint,
            margin: const EdgeInsets.only(
              //       top: 200, bottom: 50,
              left: 40,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: Colors.red,
              // boxShadow: [
              //   BoxShadow(
              //     color:
              //         active ? Color.fromARGB(34, 0, 0, 0) : Colors.transparent,
              //     blurRadius: blur,
              //     offset: Offset(offsetx, offsety),
              //   )
              // ],
            ),
            child: CustomPaint(
              painter: CustomRectPainter(ctx: context),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -40,
                    child: Center(
                      child: SimpleShadow(
                        color: Colors.black12,
                        sigma: 5,
                        offset: const Offset(3, 2),
                        child: Image.asset(
                          fetchedData[i].img,
                          // "assets/PS5.png",                              // Url of the image png---------------------------
                          fit: BoxFit.contain,
                          height: 195,
                          width: 195,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 5,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        "assets/PS-Logo.png",
                        fit: BoxFit.cover,
                        color: const Color.fromRGBO(206, 217, 224, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 30,
                    child: Text(
                      fetchedData[i].name,
                      // "Playstation 5",                                    // Name of the Console---------------------------
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 10,
                    child: Text(
                      fetchedData[i]
                          .subs, // Subtitle of the Console---------------------------
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
