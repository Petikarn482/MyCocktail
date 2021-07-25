import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cocktail/constants.dart';
import 'package:my_cocktail/ui_windows/search_window.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyCocktail()));
}

class MyCocktail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        // primaryColor: kBackgroundColor,
        // textTheme: Theme.of(context).textTheme.apply(
        //       fontFamily: 'Roboto',
        //       bodyColor: Colors.white,
        //     ),
      ),
      debugShowCheckedModeBanner: false,
      home: SearchWindow(),
    );
  }
}
