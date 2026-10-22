
import 'package:flutter/material.dart';

class Counterscreen extends StatefulWidget {
  const Counterscreen({super.key});

  @override
  State<Counterscreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<Counterscreen> {
  int clickCounter = 0;

  // Incrementar el contador
  void incrementar() {
    setState(() {
      clickCounter++;
    });
  }

  // Decrementar el contador sin permitir números negativos
  void decrementar() {
    setState(() {
      if (clickCounter > 0) {
        clickCounter--;
      }
    });
  }

  // Reiniciar el contador
  void reiniciar() {
    setState(() {
      clickCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Pantalla del Contador'),
        ),
        actions: [
          IconButton(
            onPressed: reiniciar,
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Reiniciar contador',
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              clickCounter == 1 ? 'Click' : 'Clicks',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'restar',
            onPressed: decrementar,
            tooltip: 'Restar uno',
            shape: const StadiumBorder(),
            child: const Icon(Icons.exposure_minus_1),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'sumar',
            onPressed: incrementar,
            tooltip: 'Sumar uno',
            shape: const StadiumBorder(),
            child: const Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}
