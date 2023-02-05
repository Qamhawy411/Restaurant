

class Recipe {
  String label;
  String imageUrl;
  double servings;
List<Ingredient> ingredients;

  Recipe(
    this.label,
    this.imageUrl,
    this.servings,
    this.ingredients,
    
  );
  static List<Recipe> samples = [
    Recipe(
      'Spaghetti and Meatballs',
      'https://tse3.mm.bing.net/th?id=OIP.qYvrHjPGMrct3XvEQc2ZogHaLH&pid=Api&P=0',
          4,
        [
           Ingredient(1, 'box', 'Spaghetti',),
          Ingredient(4, '', 'Frozen Meatballs',),
           Ingredient(0.5, 'jar', 'sauce',),
           ],
    ),
    Recipe(
      'Tomato Soup',
      'http://baliindiancuisine.com/wp-content/uploads/2014/10/indian-food-recipes-easy.jpg',
      2,
         [
         Ingredient(1, 'can', 'Tomato Soup',),
               ],
    ),
    Recipe(
      'Grilled Cheese',
      'https://images.immediate.co.uk/production/volatile/sites/30/2020/05/aubergine-curry-d843822.jpg?quality=90&resize=960,872',
          1,
          [
           Ingredient(2, 'slices', 'Cheese',),
            Ingredient(2, 'slices', 'Bread',)
             ],
    
    ),
    Recipe(
      'Chocolate Chip Cookies',
      'https://tse2.mm.bing.net/th?id=OIP.paXZvwnQu4x1MvEa_KgCogHaEK&pid=Api&P=0',
      24,
            [
            Ingredient(4, 'cups', 'flour',),
            Ingredient(2, 'cups', 'sugar',),
            Ingredient(0.5, 'cups', 'chocolate chips',),
            ],
    ),
    Recipe(
      'Taco Salad',
      'https://tse1.mm.bing.net/th?id=OIP.zCMZGYpmjxMCkRpmMc5DPwHaLH&pid=Api&P=0',
      1,
              [
              Ingredient(4, 'oz', 'nachos',),
              Ingredient(3, 'oz', 'taco meat',),
              Ingredient(0.5, 'cup', 'cheese',),
              Ingredient(0.25, 'cup', 'chopped tomatoes',),
              ],
    ),
    Recipe(
      'Hawaiian Pizza',
      'https://recipes-for-all.com/wp-content/uploads/2021/01/yangnyeomchicken-e1610456529210.jpg',
      4,
            [
            Ingredient(1, 'item', 'pizza',),
            Ingredient(1, 'cup', 'pineapple',),
            Ingredient(8, 'oz', 'ham',),
            ],
    ),
  ];
}

class Ingredient {
 double quantity;
 String measure;
 String name;
 Ingredient(
 this.quantity,
 this.measure,
 this.name,
 );
}
