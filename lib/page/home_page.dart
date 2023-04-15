// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         //TODO : bikin tampilan UI
//         );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    // double bmi = _weight / ((_height / 100) * (_height / 100));
    String BMICategory;
    if (_bmi>=30) BMICategory="Obese";
    else if (_bmi>=29.9) BMICategory="Overweight";
    else if (_bmi>=24.9) BMICategory="Normal";
    else if (_bmi>=18.5) BMICategory="Underweight";
    else BMICategory=" ";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 90, 215),
        title: Text("BMI Calculator"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 52, 90, 215)
        ),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/image.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Username: $username",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "BMI Result: ${_bmi.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "BMI Category: $BMICategory",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Height (cm)",
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                _height = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Weight (kg)",
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                _weight = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text("Calculate BMI"),
              style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            ),
          ],
        ),
        
      ),
    );
  }
}
