import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MainApp());
}

int contador = 1;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  late double n1;
  late double n2;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double var_txt = 0;
  //TextEditingController nameController = TextEditingController();
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  double test() {
    double y = 0;
    //contador++;
    if (contador == 0) {
      myController.text = '0';
      myController2.text = '0';
      y = 0;
    }
    if (contador == 1) {
      y = suma();
    }
    if (contador == 2) {
      y = resta();
    }
    if (contador == 3) {
      y = multiplicacion();
    }
    if (contador == 4) {
      y = division();
    }
    return y;
  }

  @override
  void dispose() {
    // en vez de hacer dispose, he cambiado la función para que los valores de el texto de los controladores, sea 0.
    myController.text = '0';
    myController2.text = '0';
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      _printLatestValue();
    });
    myController2.addListener(() {
      _printLatestValue2();
    });
  }

  String _printLatestValue() {
    print(myController.text);
    return myController.text;
  }

  String _printLatestValue2() {
    print(myController2.text);
    return myController.text;
  }

  double convertToDouble(TextEditingController controller) {
    try {
      double value = double.parse(controller.text);
      return value;
    } catch (e) {
      throw FormatException('Invalid input. Please enter a valid number.');
    }
  }

  void fn_boton() {
    setState(() => var_txt = test());
  }

  void fn_reset() {
    dispose();
    contador = 0;
  }

  double suma() {
    contador = 1;
    String num1 =
        '0'; // Inicializar variables antes, para poder cambiar su valor con el try-catch
    String num2 = '0';
    double suma = 0;
    try {
      double num1 = convertToDouble(myController);
      double num2 = convertToDouble(myController2);
      suma = num1 + num2;
    } catch (e) {
      print(e
          .toString()); // Output: FormatException: Invalid input. Please enter a valid number.
    }
    print(suma);
    return suma;
  }

  double resta() {
    contador = 2;
    String num1 = '0';
    String num2 = '0';
    double resta = 0;
    try {
      double num1 = convertToDouble(myController);
      double num2 = convertToDouble(myController2);
      resta = num1 - num2;
    } catch (e) {
      print(e.toString());
    }
    print(resta);
    return resta;
  }

  double multiplicacion() {
    contador = 3;
    String num1 = '0';
    String num2 = '0';
    double multiplicacion = 0;
    try {
      double num1 = convertToDouble(myController);
      double num2 = convertToDouble(myController2);
      multiplicacion = num1 * num2;
    } catch (e) {
      print(e.toString());
    }
    print(multiplicacion);
    return multiplicacion;
  }

  double division() {
    contador = 4;
    String num1 = '0';
    String num2 = '0';
    double division = 0;
    try {
      double num1 = convertToDouble(myController);
      double num2 = convertToDouble(myController2);
      division = num1 / num2;
    } catch (e) {
      print(e.toString());
    }
    print(division);
    return division;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora sencilla"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 100.0,
            child: TextField(
              controller: myController,
            ),
          ),
          SizedBox(
            width: 100.0,
            child: TextField(
              controller: myController2,
            ),
          ),
          Text("El resultado de la operación es: "),
          Text(test().toString()),
          ElevatedButton(onPressed: () => fn_boton(), child: Text("Press me")),
        ],
      )),
      floatingActionButton: SpeedDial(
          icon: Icons.menu,
          backgroundColor: Colors.blue,
          label: Text('Menu de operaciones'),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add, color: Colors.white),
              label: 'Suma',
              backgroundColor: Colors.blueAccent,
              onTap: () {
                suma();
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.remove, color: Colors.white),
              label: 'Resta',
              backgroundColor: Colors.blueAccent,
              onTap: () {
                resta();
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.clear, color: Colors.white),
              label: 'Multiplicacion',
              backgroundColor: Colors.blueAccent,
              onTap: () {
                multiplicacion();
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.crop_square, color: Colors.white),
              label: 'Division',
              backgroundColor: Colors.blueAccent,
              onTap: () {
                division();
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.restore, color: Colors.white),
              label: 'Valores por defecto',
              backgroundColor: Colors.blueAccent,
              onTap: () {
                fn_reset();
              },
            ),
          ]),
    );
  }
}
