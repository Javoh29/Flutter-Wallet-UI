class Foods{
  String name;
  int ingredients;
  String imageUrl;
  List<Ingredients> ingred;

  Foods({this.name, this.ingredients, this.imageUrl, this.ingred});

}

class Ingredients{
  String name;
  double mass;
  String price;
  String imageUrl;

  Ingredients({this.name, this.mass, this.price, this.imageUrl});

}

class FoodsPop{
  String name;
  int ingredients;
  int likes;
  String imageUrl;

  FoodsPop({this.name, this.ingredients, this.likes, this.imageUrl});

}

final List<Foods> foods = [
  Foods(
    name: 'Salad Egg',
    ingredients: 12,
    imageUrl: 'assets/images/rec_1.jpg',
    ingred: [
      Ingredients(
        name: 'Avocado',
        mass: 20.0,
        price: '\$2.00/kg',
        imageUrl: 'assets/images/f1.jpg'
      ),
      Ingredients(
          name: 'Pineapple',
          mass: 5.0,
          price: '\$0.95/kg',
          imageUrl: 'assets/images/f2.jpg'
      ),
      Ingredients(
          name: 'Broccoli',
          mass: 50.0,
          price: '\$1.00/kg',
          imageUrl: 'assets/images/f3.jpg'
      ),
      Ingredients(
          name: 'Tomato',
          mass: 100.0,
          price: '\$3.00/kg',
          imageUrl: 'assets/images/f4.jpg'
      )
    ]
  ),
  Foods(
      name: 'Blue Cake',
      ingredients: 8,
      imageUrl: 'assets/images/rec_2.jpg',
      ingred: [
        Ingredients(
            name: 'Avocado',
            mass: 20.0,
            price: '\$2.00/kg',
            imageUrl: 'assets/images/f1.jpg'
        ),
        Ingredients(
            name: 'Pineapple',
            mass: 5.0,
            price: '\$0.95/kg',
            imageUrl: 'assets/images/f2.jpg'
        ),
        Ingredients(
            name: 'Broccoli',
            mass: 50.0,
            price: '\$1.00/kg',
            imageUrl: 'assets/images/f3.jpg'
        ),
        Ingredients(
            name: 'Tomato',
            mass: 100.0,
            price: '\$3.00/kg',
            imageUrl: 'assets/images/f4.jpg'
        )
      ]
  )
];

final List<FoodsPop> foodsPop = [
  FoodsPop(
    name: 'Dumplings',
    ingredients: 12,
    likes: 120,
    imageUrl: 'assets/images/pop_1.jpg'
  ),
  FoodsPop(
      name: 'Salad Egg',
      ingredients: 12,
      likes: 86,
      imageUrl: 'assets/images/pop_2.jpg'
  ),
  FoodsPop(
      name: 'Strayd',
      ingredients: 12,
      likes: 60,
      imageUrl: 'assets/images/pop_3.jpg'
  ),
  FoodsPop(
      name: 'Dumplings',
      ingredients: 12,
      likes: 120,
      imageUrl: 'assets/images/pop_1.jpg'
  ),
  FoodsPop(
      name: 'Salad Egg',
      ingredients: 12,
      likes: 86,
      imageUrl: 'assets/images/pop_2.jpg'
  ),
  FoodsPop(
      name: 'Strayd',
      ingredients: 12,
      likes: 60,
      imageUrl: 'assets/images/pop_3.jpg'
  )
];