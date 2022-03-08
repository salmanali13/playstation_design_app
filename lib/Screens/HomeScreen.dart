import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:playstation_design_app/Models/RelatedPrdct_Model.dart';
// import 'package:flutter/rendering.dart';
import 'package:playstation_design_app/Widgets/ProductsPageWidget.dart';
import 'package:playstation_design_app/theme.dart';

import '../Widgets/CustomPaintersWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RelatedProdModel> relatedProducts = RelatedProducts.products;
  int active = 2;

  @override
  Widget build(BuildContext context) {
    // This is the shadow we hav used on every element in the screen
    // final shadow = [
    //   const BoxShadow(
    //     color: Color.fromARGB(40, 0, 0, 0),
    //     blurRadius: 10,
    //     offset: Offset(5, 4),
    //     spreadRadius: 1,
    //   ),
    //   const BoxShadow(
    //     color: Color.fromARGB(71, 255, 255, 255),
    //     blurRadius: 10,
    //     offset: Offset(-5, -4),
    //     spreadRadius: 1,
    //   )
    // ];

    // This is the List of widgets in the listView.Builder()---------------
    List relatedProductsList = [
      buildRelatedPrduct(context, AppTheme.shadow, 0),
      buildRelatedPrduct(context, AppTheme.shadow, 1),
      buildRelatedPrduct(context, AppTheme.shadow, 2),
      buildRelatedPrduct(context, AppTheme.shadow, 3),
      buildRelatedPrduct(context, AppTheme.shadow, 4),
      // buildRelatedPrduct(context, AppTheme.shadow, 5),
      // buildRelatedPrduct(context, AppTheme.shadow, 6),
    ];

    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
// Build Method starts from here------------
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: active,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add,
                size: 30,
                color: active == 0
                    ? Colors.white
                    : Theme.of(context).iconTheme.color),
            Icon(Icons.list,
                size: 30,
                color: active == 1
                    ? Colors.white
                    : Theme.of(context).iconTheme.color),
            Icon(Icons.compare_arrows,
                size: 30,
                color: active == 2
                    ? Colors.white
                    : Theme.of(context).iconTheme.color),
            Icon(Icons.call_split,
                size: 30,
                color: active == 3
                    ? Colors.white
                    : Theme.of(context).iconTheme.color),
            Icon(Icons.perm_identity,
                size: 30,
                color: active == 4
                    ? Colors.white
                    : Theme.of(context).iconTheme.color),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            Future.delayed(const Duration(milliseconds: 550), () {
              setState(() {
                active = index;
              });
            });
          },
          letIndexChange: (index) => true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              //----------------------------------------------------------------------
              buildBackground(context),
              //----------------------------------------------------------------------

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This is the search bar Row-------------------------------------
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, left: 20, right: 20, bottom: 20),
                    // width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                              boxShadow: AppTheme.shadow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(Icons.search_rounded),
                                label: const Text("Search"),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: null,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 53, 53, 53),
                              boxShadow: AppTheme.shadow,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.filter_alt_rounded),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.05,
                  // ),
                  //---------------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 25.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Featured",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Preorders",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.05,
                  // ),
                  //---------------------------------------------------------------------
                  const SizedBox(height: 300, child: ProductsPage()),

                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 25.0,
                    ),
                    child: Text(
                      "Related",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.3,
                  // ),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        itemCount: relatedProductsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return relatedProductsList[index];
                        }),
                  ),

                  // This sizedbox is just for avoiding the bottom content
                  // overlaying-------------------------------------------
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ],
              )
              //----------------------------------------------------------------------
            ],
          ),
        ));
  }

// Returns the Background of the screen--------------------------------------------
  Row buildBackground(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
        ),
        Expanded(
          child: CustomPaint(
            foregroundPainter: RadialLinesPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(30)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(54, 185, 232, 1),
                    Color.fromRGBO(71, 105, 235, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// This returns the single related product item to listView.Builder------------
  Center buildRelatedPrduct(
      BuildContext context, List<BoxShadow> shadow, int i) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
          boxShadow: shadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            relatedProducts[i]
                .img, // This is related products image url-------------
            // "assets/ps5cntroller.png",
            fit: BoxFit.cover,
          ),
        ),
        //  Icon(
        //   icon,
        //   size: 35,
        // ),
      ),
    );
  }
}
