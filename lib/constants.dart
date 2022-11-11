import 'package:flutter/material.dart';

const kMainUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";
const kRandomUrl = "https://www.thecocktaildb.com/api/json/v1/1/random.php";

const kBackgroundColor = Color(0xFF601E34);
const kComponentColor = Color(0xFF0E060E);
const kGroupBackgroundColor = Color(0xFF67383D);

const kHeaderTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const kTableTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w500,
);

const kBorderSide = BorderSide(
  color: kComponentColor,
  width: 20,
);

const kBoxDecorationStyle = BoxDecoration(
  color: kGroupBackgroundColor,
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

const kButtonMinSize = Size(100, 55);
