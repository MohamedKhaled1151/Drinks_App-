class DrinksModel {
  final String name;
  final String image;
  final String title;
  final String price;

  DrinksModel(
      {required this.name,
      required this.image,
      required this.title,
      required this.price});

  static List<DrinksModel> drinks = [
    DrinksModel(
      name: "Brownie Island",
      image: "assets/drinks/Brownie Island.png",
      title: "Chocolate brownie drink",
      price: "£ 100",
    ),
    DrinksModel(
      name: "Banana Drink",
      image: "assets/drinks/Banana.png",
      title: "Fresh banana drink",
      price: "£ 90",
    ),
    DrinksModel(
      name: "Carmel",
      image: "assets/drinks/carmel.png",
      title: "Fresh Caramel drink",
      price: "£ 100",
    ),
    DrinksModel(
      name: "Chocolate Drink",
      image: "assets/drinks/Salted Caramel.png",
      title: "Rich chocolate drink",
      price: "£ 120",
    ),
    DrinksModel(
      name: "Peanut Butter",
      image: "assets/drinks/Peanut Butter.png",
      title: "Creamy peanut butter drink",
      price: "£ 150",
    ),
    DrinksModel(
      name: "Salted Caramel Drink",
      image: "assets/drinks/Chocolate.png",
      title: "     Sweet and salty caramel drink",
      price: "£ 150",
    ),
    DrinksModel(
      name: "Strawberry Drink",
      image: "assets/drinks/Strawberry.png",
      title: "Fresh strawberry drink",
      price: "£ 80",
    ),
    DrinksModel(
      name: "Burger",
      image: "assets/drinks/burger.png",
      title: "Juicy beef burger",
      price: "£ 65",
    ),
    DrinksModel(
      name: "Chicken Burger",
      image: "assets/drinks/chicken.png",
      title: "Crispy chicken burger",
      price: "£ 95",
    ),
  ];
}
