import 'package:flutter/material.dart';
import 'package:my_cocktail/constants.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({@required this.instructionsEN});

  final String instructionsEN;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Instructions',
            style: kTableTextStyle,
          ),
          SizedBox(height: 30),
          //getItems(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(instructionsEN),
            ),
          ),
        ],
      ),
    );
  }
}
