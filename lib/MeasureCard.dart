import 'package:flutter/material.dart';
import './RoundButton.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard(
      {Key? key,
      required this.title,
      required this.measure,
      required this.unit,
      required this.increment,
      required this.decrement})
      : super(key: key);
  final String title;
  final int measure;
  final String unit;
  final void Function() increment;
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              measure.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              unit.toString(),
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(content: '-', onPress: decrement),
            RoundButton(content: '+', onPress: increment)
          ],
        )
      ],
    );
  }
}
