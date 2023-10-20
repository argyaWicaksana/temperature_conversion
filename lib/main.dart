import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userInput = TextEditingController();

  double _kelvin = 0;
  double _reamur = 0;
  double _celcius = 0;

  void convertTemp() {
    setState(() {
      if (userInput.text != '') {
        _celcius = double.parse(userInput.text);
        _kelvin = _celcius + 273;
        _reamur = (4/5) * _celcius;
      } else {
        _kelvin = 0;
        _reamur = 0;
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Konverter Suhu',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Masukkan suhu dalam celcius',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: userInput,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Suhu dalam Kelvin',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        _kelvin.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Suhu dalam Reamur',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        _reamur.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              TextButton(
                onPressed: () => convertTemp(),
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Konversi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
