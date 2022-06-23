import 'package:my_app/constants/app_constants.dart';
import 'package:my_app/widgets/left_bar.dart';
import 'package:my_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  get key => null;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmiDoubleResult = 0;
  String bmiResultFinal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Container for height
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 130,
                    child: TextField(
                      controller: heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  ), // Container for weight
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 130,
                    child: TextField(
                      controller: weightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),
              // ignore: avoid_unnecessary_containers
              GestureDetector(
                onTap: () {
                  double heightValue = double.parse(heightController.text);
                  double weightValue = double.parse(weightController.text);

                  double imperialKey = 703;
                  setState(() {
                    bmiDoubleResult = (imperialKey * weightValue) /
                        (heightValue * heightValue);
                    if (bmiDoubleResult < 18.5) {
                      bmiResultFinal = "You are under weight";
                    } else if (bmiDoubleResult >= 18.5 &&
                        bmiDoubleResult <= 25) {
                      bmiResultFinal = "You are normal weight";
                    } else if (bmiDoubleResult >= 25 && bmiDoubleResult <= 30) {
                      bmiResultFinal = "You are overweight";
                    } else {
                      bmiResultFinal = "You are obese";
                    }
                  });
                },
                child: Text(
                  bmiDoubleResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              // ignore: avoid_unnecessary_containers
              Visibility(
                visible: bmiResultFinal.isNotEmpty,
                child: Text(
                  bmiResultFinal,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              LeftBar(key: key, barWidth: 40),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              LeftBar(key: key, barWidth: 70),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              LeftBar(key: key, barWidth: 40),

              //right style stly loading bars
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              RightBar(key: key, barWidth: 70),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),
              RightBar(key: key, barWidth: 70),
            ],
          ),
        ));
  }
}
