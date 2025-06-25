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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 229, 68, 9)),
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
        ),
      ),
    );
  }
}
