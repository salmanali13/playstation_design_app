class ConsoleModel {
  String name;
  String subs;
  String img;
  double price;
  String object;
  String description;

  ConsoleModel(
    this.name,
    this.subs,
    this.img,
    this.price,
    this.object,
    this.description,
  );
}

class DemoConsoles {
  static List<ConsoleModel> get consoleList {
    return [..._consolesList];
  }

  static final List<ConsoleModel> _consolesList = [
    ConsoleModel(
        "Playstation 5",
        "Digital Edition",
        "assets/PS5.png",
        499,
        "assets/ps5_object/PS5.obj",
        "Maximize your play sessions with near instant load times for installed PS5 Games"),
    //---------------------------------------------------
    ConsoleModel(
        "Playstation 5",
        "Digital Edition",
        "assets/PS5.png",
        499,
        "assets/ps5_object/PS5.obj",
        "Maximize your play sessions with near instant load times for installed PS5 Games"),
    //---------------------------------------------------
    ConsoleModel(
        "Playstation 5",
        "Digital Edition",
        "assets/PS5.png",
        499,
        "assets/ps5_object/PS5.obj",
        "Maximize your play sessions with near instant load times for installed PS5 Games"),
    //---------------------------------------------------
    ConsoleModel(
        "Playstation 5",
        "Digital Edition",
        "assets/PS5.png",
        499,
        "assets/ps5_object/PS5.obj",
        "Maximize your play sessions with near instant load times for installed PS5 Games"),
  ];
}
