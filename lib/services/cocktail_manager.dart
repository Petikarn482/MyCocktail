import 'package:my_cocktail/services/ingredient.dart';

class CocktailManager {
  String name;
  String category;
  String alcoholic;
  String glassType;
  String pictureUrl;
  List<Ingredient> ingredients;
  String instructions;

  CocktailManager(
      {this.name,
      this.category,
      this.alcoholic,
      this.glassType,
      this.pictureUrl,
      this.ingredients,
      this.instructions});
}
