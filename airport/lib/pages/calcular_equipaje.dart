import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TuitionPage extends StatefulWidget {
  const TuitionPage({super.key});

  @override
  State<TuitionPage> createState() => _TuitionPageState();
}

class _TuitionPageState extends State<TuitionPage> {
  String pesoText = '';
  String equipajeText = '';
  String resultText = '';

  void calculateTuition() {
    final peso = double.tryParse(pesoText.replaceAll(',', '.')) ?? 0.0;
    final limite = double.tryParse(equipajeText.replaceAll(',', '.')) ?? 0.0;

    if (limite <= 0 || peso <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos (mayores que 0).';
      });
      return;
    }

    String mensaje;

    if (peso > limite) {
      final excedente = peso - limite;
      mensaje = 'Supera el límite';
    } else if (peso == limite) {
      mensaje = 'Peso justo en el límite';
    } else {
      mensaje = 'Dentro del límite';
    }

    setState(() {
      resultText =
        'Peso equipaje: ${peso.toStringAsFixed(2)} kg\n'
        'Resultado: $mensaje';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de equipaje'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Calculo de equipaje',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Limite de peso (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  equipajeText = value;
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Peso de equipaje (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  pesoText = value;
                },
              ),


              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateTuition,
                child: const Text('Verificar equipaje'),
              ),

              const SizedBox(height: 16),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
