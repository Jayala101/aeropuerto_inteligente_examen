import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdmissionsHomePage extends StatelessWidget {
  const AdmissionsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aeropuerto Inteligente')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/equipaje'),
              child: const Text('Calculadora de equipaje'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/vuelos'),
              child: const Text('Plan de vuelos'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/equipaje'),
              child: const Text('Prioridad de embarque'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
