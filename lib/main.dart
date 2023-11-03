import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BMICalculator(),
      debugShowCheckedModeBanner: false,
    ));

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double weight = 0;
  double height = 0;
  double bmi = 0;
  String bmiKategori = '';
  Color bmiKaltegoriWarna = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator - Diana Sari'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Masukkan berat badan (kg):',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    weight = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Masukkan tinggi badan (cm):',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    height = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (weight > 0 && height > 0) {
                    double heightInMeters = height / 100;
                    bmi = weight / (heightInMeters * heightInMeters);

                    if (bmi < 18.5) {
                      bmiKategori = 'Kekurangan Berat Badan';
                      bmiKaltegoriWarna = Colors.blue;
                    } else if (bmi >= 18.5 && bmi < 24.9) {
                      bmiKategori = 'Ideal';
                      bmiKaltegoriWarna = Colors.green;
                    } else if (bmi >= 25.0 && bmi < 29.9) {
                      bmiKategori = 'Kelebihan Berat Badan';
                      bmiKaltegoriWarna = Colors.yellow;
                    } else {
                      bmiKategori = 'Gemuk';
                      bmiKaltegoriWarna = Colors.red;
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Test BMI Kamu',
                              textAlign: TextAlign.center),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('BMI: ${bmi.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center),
                              Text('Kategori: $bmiKategori',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: bmiKaltegoriWarna)),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Ulang Berat Badan dan Tinggi Badan.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    weight = 0;
                    height = 0;
                    bmi = 0;
                    bmiKategori = '';
                    bmiKaltegoriWarna = Colors.grey;
                  });
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
