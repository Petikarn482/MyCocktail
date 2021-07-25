import 'dart:ui';
import 'package:flutter/material.dart';

// General URL (at the end of the string add margarita)
const urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";
const urlStringRandom =
    "https://www.thecocktaildb.com/api/json/v1/1/random.php";

// Colors
const kBackgroundColor = Color(0xFF1F2129);
const kGroupBackgroundColor = Color(0xFF383D4D);
const kComponentColor = Color(0xFF3C4D74);

// Text Style
const kLogoTextStyle = TextStyle();
const kHeaderTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);
const kTableTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

// Misc
const kBorderSide = BorderSide(
  color: kComponentColor,
  width: 5,
);

const kBoxDecorationStyle = BoxDecoration(
  color: kGroupBackgroundColor,
  borderRadius: BorderRadius.all(Radius.circular(30)),
);

const kButtonMinSize = Size(100, 55);

const kSizedBoxHeight20 = SizedBox(height: 20);
