import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/app_constant.dart';
import 'package:flutter_bmi_calculator/widgets/left_bar.dart';
import 'package:flutter_bmi_calculator/widgets/right_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
          ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w300, color: Colors.yellow),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'cm',
                      labelStyle: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                      ),
                      hintText: "Height",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 130,
                  child: TextField(
                    controller: _widthController,
                    style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.yellow),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "kg",
                      labelStyle: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                      ),
                      hintText: "Weight",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              // onTap: (){
              //   double _h = double.parse(_heightController.text);
              //   double _w = double.parse(_widthController.text);
              //   setState(() {
              //     _bmiResult = _w / (_h * _h);
              //     // _textResult = _bmiResult.toStringAsFixed(2);
              //     if(_bmiResult>25){
              //       _textResult = "You are Overweight";
              //     }
              //     else if(_bmiResult>18.5){
              //       _textResult = "You are Normal";
              //     }
              //     else{
              //       _textResult = "You are Underweight";
              //     }
              //   });
              // },
             child: ElevatedButton(
                onPressed: () {
                  // Respond to button press
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_widthController.text);
                  setState(() {
                    // _bmiResult = _w / (_h * _h);
                    _bmiResult = (_w/_h/_h)*10000;
                    // _textResult = _bmiResult.toStringAsFixed(2);
                    if (_bmiResult > 25) {
                      _textResult = "You are Overweight";
                    } else if (_bmiResult > 18.5) {
                      _textResult = "You are Normal";
                    } else {
                      _textResult = "You are Underweight";
                    }
                  });
                  
                },
                child: const Text('Press & Calculate'),
              ),
              // child: Container(
              //   child: const Text("Calculate", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.yellow),),
              // ),
            ),


            const SizedBox(height: 30),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2), style: const TextStyle(fontSize: 30, color: Colors.yellow),),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult, style: TextStyle(fontSize: 33, color: Colors.yellow),),
              ),
            ),
            const SizedBox(height: 100),
            const LeftBar(barWidth: 40.0),
            const SizedBox(height: 20),
            const LeftBar(barWidth: 70.0),
            const SizedBox(height: 20),
            const LeftBar(barWidth: 40.0),
            const SizedBox(height: 20),
            const RightBar(barWidth: 50.0),
            const SizedBox(height: 20),
            const RightBar(barWidth: 75.0),
            const SizedBox(height: 20),
            const RightBar(barWidth: 45.0),
          ],
          
        ),
      ),
    );
  }
}