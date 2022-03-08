class RelatedProdModel {
  String name;
  String img;
  RelatedProdModel(this.name, this.img);
}

class RelatedProducts {
  static List<RelatedProdModel> get products {
    return [..._products];
  }

  static final List<RelatedProdModel> _products = [
    RelatedProdModel("PS5 Controller", "assets/ps5cntroller.png"),
    RelatedProdModel("XBOX Controller", "assets/ps5cntroller.png"),
    RelatedProdModel("XBOX Controller", "assets/ps5cntroller.png"),
    RelatedProdModel("XBOX Controller", "assets/ps5cntroller.png"),
    RelatedProdModel("XBOX Controller", "assets/ps5cntroller.png"),
  ];
}
