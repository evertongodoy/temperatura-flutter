import 'package:flutter/material.dart';

void main() {
  runApp(const TemperaturaApp());
}

class TemperaturaApp extends StatelessWidget {
  const TemperaturaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperatura Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 227, 241, 26)),
      ),
      home: const TemperaturaScreen(title: 'Temperatura Senac'),
    );
  }
}

class TemperaturaScreen extends StatefulWidget {
  const TemperaturaScreen({super.key, required this.title});

  final String title;

  @override
  State<TemperaturaScreen> createState() => _TemperaturaScreenState();
}

class _TemperaturaScreenState extends State<TemperaturaScreen> {
  
  final TextEditingController _temp = TextEditingController();
  String _resultado = '';

  double converter_para_fahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  double converter_para_kelvin(double celsius) {
    return celsius + 273.15;
  }

  void _converter(String op) {

    final temperatura = double.tryParse(_temp.text.replaceAll(',', '.'));
    
    if (temperatura == null) {
      setState(() => _resultado = 'Entrada inválida');
      return;
    }

    double res;
    switch (op) {
      case 'Fahrenheit': res = converter_para_fahrenheit(temperatura); break;
      default: res = converter_para_kelvin(temperatura); break;
    }

    setState(() => _resultado = res.toString());
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _temp,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Digite uma Temperatura em Celsius'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _converter('Fahrenheit'), child: const Text('Fahrenheit')),
                ElevatedButton(onPressed: () => _converter('Kelvin'), child: const Text('Kelvin')),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
