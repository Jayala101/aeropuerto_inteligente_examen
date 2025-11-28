import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  final int flightCount = 5;
  List<String> durationTexts = List.filled(5, '');
  String resultText = '';

  void calculateTotalTime() {
    double total = 0.0;
    int n = 0;

    for (var text in durationTexts) {
      final value = double.tryParse(text.replaceAll(',', '.'));
      if (value != null && value > 0) {
        total += value;
        n++;
      }
    }

    if (n == 0) {
      setState(() {
        resultText = 'Ingrese al menos una duración válida (minutos).';
      });
      return;
    }

    final average = total / n;

    setState(() {
      resultText =
          'Tiempo total: ${total.toStringAsFixed(0)} minutos\n'
          'Promedio: ${average.toStringAsFixed(1)} minutos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Vuelos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Registrar duración (min) de los vuelos programados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            ...List.generate(flightCount, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Duración vuelo ${index + 1} (min)',
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    durationTexts[index] = value;
                  },
                ),
              );
            }),

            ElevatedButton(
              onPressed: calculateTotalTime,
              child: const Text('Calcular tiempo total'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
