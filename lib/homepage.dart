import 'dart:math';

import 'package:bmi_calculator_app/MeasureCard.dart';
import 'package:flutter/material.dart';
import './iconContent.dart';
import './ReuseableCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedGender = 0;
  int weight = 50;
  int height = 160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            ReusableCard(
                cardChild: IconContent(
                  icon: Icons.male,
                  title: 'Male',
                  active: selectedGender == 0,
                ),
                onPress: () {
                  setState(() {
                    selectedGender = 0;
                  });
                }),
            ReusableCard(
                cardChild: IconContent(
                  icon: Icons.female,
                  title: 'Female',
                  active: selectedGender == 1,
                ),
                onPress: () {
                  setState(() {
                    selectedGender = 1;
                  });
                })
          ]),
          Row(
            children: [
              ReusableCard(
                  cardChild: MeasureCard(
                    title: 'Weight',
                    measure: weight,
                    unit: 'kg',
                    increment: () {
                      setState(() {
                        weight++;
                      });
                    },
                    decrement: () {
                      setState(() {
                        if (weight != 0) {
                          weight--;
                        }
                      });
                    },
                  ),
                  onPress: () {}),
              ReusableCard(
                  cardChild: MeasureCard(
                    title: 'Height',
                    measure: height,
                    unit: 'cm',
                    increment: () {
                      setState(() {
                        height++;
                      });
                    },
                    decrement: () {
                      setState(() {
                        if (height != 0) {
                          height--;
                        }
                      });
                    },
                  ),
                  onPress: () {}),
            ],
          ),
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              String status;
              if (bmi < 18.5) {
                status = 'Under Weight';
              } else if (bmi >= 18.5 && bmi <= 24.9) {
                status = 'Healthy';
              } else if (bmi >= 25.0 && bmi <= 29.9) {
                status = 'Over Weight';
              } else {
                status = 'Obese';
              }
              String bmi_string = bmi.toStringAsFixed(2);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Your BMI is $bmi_string. $status',
                          style: TextStyle(fontSize: 25)),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Back'))
                      ],
                    );
                  });
            },
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 70,
              child: Center(
                  child: Text('Calculate',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),
    );
  }
}
