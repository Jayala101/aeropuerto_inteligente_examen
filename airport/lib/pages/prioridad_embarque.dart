import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final List<String> passengerTypes = [
    'Adulto mayor',
    'Familia con niños',
    'Pasajero regular',
  ];

  final List<String> ticketClasses = [
    'Económica',
    'Ejecutiva',
  ];

  String selectedPassengerType = 'Pasajero regular';
  String selectedTicketClass = 'Económica';
  String resultText = '';

  void calculatePriority() {
    String priority = 'Baja';
    if (selectedPassengerType == 'Adulto mayor' || selectedTicketClass == 'Ejecutiva') {
      priority = 'Alta';
    } else if (selectedPassengerType == 'Familia con niños') {
      priority = 'Media';
    } else {
      priority = 'Baja';
    }
    setState(() {
      resultText = 'Prioridad de embarque: $priority';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prioridad de embarque'),
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
              'Determinar prioridad de embarque',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text('Tipo de pasajero'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedPassengerType,
              isExpanded: true,
              items: passengerTypes.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedPassengerType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            const Text('Clase de boleto'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedTicketClass,
              isExpanded: true,
              items: ticketClasses.map((c) {
                return DropdownMenuItem(value: c, child: Text(c));
              }).toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedTicketClass = value;
                });
              },
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: calculatePriority,
              child: const Text('Calcular prioridad'),
            ),

            const SizedBox(height: 16),
            Text(resultText, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
