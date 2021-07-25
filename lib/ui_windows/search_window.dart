import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_cocktail/constants.dart';
import 'package:my_cocktail/services/cocktail_manager.dart';
import 'package:my_cocktail/services/ingredient.dart';
import 'package:my_cocktail/ui_windows/result_window.dart';
import 'package:http/http.dart';

class SearchWindow extends StatefulWidget {
  SearchWindow({Key key}) : super(key: key);

  @override
  _SearchWindowState createState() => _SearchWindowState();
}

class _SearchWindowState extends State<SearchWindow> {
  String cocktailName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100),
              //Logo Text
              Center(
                child: Text(
                  "My Cocktail",
                  style: TextStyle(fontSize: 50),
                ),
              ),

              SizedBox(height: 200),
              //Search Input Field
              TextField(
                decoration: InputDecoration(
                  hintText: "Name a Cocktail?",
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: kBorderSide,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: kBorderSide,
                  ),
                ),
                onChanged: (value) {
                  cocktailName = value;
                },
              ),

              SizedBox(height: 20),
              //Search Button
              ElevatedButton(
                onPressed: () async {
                  CocktailManager cm = CocktailManager();

                  if (cocktailName == null) {
                    return;
                  }

                  cocktailName.toLowerCase().replaceAll(' ', '_');

                  var network = await get(Uri.parse(urlString + cocktailName));

                  var json = jsonDecode(network.body);
                  cm.name = json['drinks'][0]['strDrink'];
                  cm.alcoholic = json['drinks'][0]['strAlcoholic'];
                  cm.glassType = json['drinks'][0]['strGlass'];
                  cm.pictureUrl = json['drinks'][0]['strDrinkThumb'];
                  cm.category = json['drinks'][0]['strCategory'];
                  cm.instructions = json['drinks'][0]['strInstructions'];

                  String strIngredient, strMeasure;
                  List<Ingredient> ingredientsList = [];

                  for (int i = 0; i < 15; i++) {
                    strIngredient = 'strIngredient' + (i + 1).toString();
                    strMeasure = 'strMeasure' + (i + 1).toString();

                    ingredientsList.add(
                      Ingredient(
                          ingredient: json['drinks'][0][strIngredient],
                          measure: json['drinks'][0][strMeasure]),
                    );
                  }

                  // Remove element from List if ingredient is empty
                  ingredientsList.removeWhere((element) =>
                      element.ingredient == null && element.measure == null);

                  // If ingredient is not empyt but measure
                  // Replace null in measure to empty string
                  ingredientsList.forEach((element) {
                    if (element.measure == null) {
                      element.measure = ' ';
                    }
                  });

                  cm.ingredients = ingredientsList;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultWindow(
                          name: cm.name,
                          alcoholic: cm.alcoholic,
                          glassType: cm.glassType,
                          pictureUrl: cm.pictureUrl,
                          category: cm.category,
                          instructions: cm.instructions,
                          ingredients: cm.ingredients,
                        );
                      },
                    ),
                  );
                },
                child: Text('Show my Cocktail'),
                style: ElevatedButton.styleFrom(
                  primary: kComponentColor,
                  minimumSize: kButtonMinSize,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),

              SizedBox(height: 20),

              // Random Button
              ElevatedButton(
                onPressed: () async {
                  CocktailManager cm = CocktailManager();

                  var network = await get(Uri.parse(urlStringRandom));

                  var json = jsonDecode(network.body);
                  cm.name = json['drinks'][0]['strDrink'];
                  cm.alcoholic = json['drinks'][0]['strAlcoholic'];
                  cm.glassType = json['drinks'][0]['strGlass'];
                  cm.pictureUrl = json['drinks'][0]['strDrinkThumb'];
                  cm.category = json['drinks'][0]['strCategory'];
                  cm.instructions = json['drinks'][0]['strInstructions'];

                  String strIngredient, strMeasure;
                  List<Ingredient> ingredientsList = [];

                  for (int i = 0; i < 15; i++) {
                    strIngredient = 'strIngredient' + (i + 1).toString();
                    strMeasure = 'strMeasure' + (i + 1).toString();

                    ingredientsList.add(
                      Ingredient(
                          ingredient: json['drinks'][0][strIngredient],
                          measure: json['drinks'][0][strMeasure]),
                    );
                  }

                  // Remove element from List if ingredient is empty
                  ingredientsList.removeWhere((element) =>
                      element.ingredient == null && element.measure == null);

                  // If ingredient is not empyt but measure
                  // Replace null in measure to empty string
                  ingredientsList.forEach((element) {
                    if (element.measure == null) {
                      element.measure = ' ';
                    }
                  });

                  cm.ingredients = ingredientsList;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultWindow(
                          name: cm.name,
                          alcoholic: cm.alcoholic,
                          glassType: cm.glassType,
                          pictureUrl: cm.pictureUrl,
                          category: cm.category,
                          instructions: cm.instructions,
                          ingredients: cm.ingredients,
                        );
                      },
                    ),
                  );
                },
                child: Text('Show Random Cocktail'),
                style: ElevatedButton.styleFrom(
                  primary: kComponentColor,
                  minimumSize: kButtonMinSize,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
