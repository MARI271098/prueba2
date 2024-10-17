import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Líneas'),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.asset('assets/Mapa_Ruta_Puebla.svg.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/line1');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Línea 1'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/line2');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Línea 2'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/line3');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Línea 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
