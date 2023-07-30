// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, deprecated_member_use, duplicate_ignore, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  String range = "";
  String result = "";
  // String range=checkRange(result);
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        //Body of the App starts here
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      radioButton("Man", Colors.blue, 0),
                      radioButton("Woman", Colors.pink, 1),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Your Height in Cm : ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Your Height in Cm",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Your Weight in Kg : ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Your Weight in Kg",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    child: FlatButton(
                      onPressed: () {
                        double height =
                            double.parse(heightController.value.text);
                        double weight =
                            double.parse(weightController.value.text);
                        double result =
                            double.parse(heightController.value.text);
                        calculateBmi(height, weight);
                        checkRange(result);
                      },
                      color: Colors.blue,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Your BMI is : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      " $result ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      " $range ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void checkRange(double result) {
    if (result <= 18.5) {
      range = "Underweight";
    } else if (result <= 25) {
      range = "Healthy";
    } else if (result <= 30) {
      range = "Overweight";
    } else {
      range = "Obesity";
    }
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000); //Convert Cm to Mtr
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  //function to change index on pressed
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

//new custom Widget
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 150.0,
      // ignore: deprecated_member_use,
      child: FlatButton(
        color: currentindex == index ? color : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () {
          changeIndex(index);
        },
        child: Text(
          value,
          style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
