import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class LineScreen extends StatelessWidget {
  final int lineNumber;
  const LineScreen({Key? key, required this.lineNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> stations = getStationsForLine(lineNumber);
    return Scaffold(
      appBar: AppBar(
        title: Text('Línea $lineNumber'),
      ),
      drawer: const DrawerWidget(),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.train),
            title: Text(stations[index]),
          );
        },
      ),
    );
  }

  List<String> getStationsForLine(int line) {
    // Aquí se definen las estaciones según la línea
    return line == 1
        ? ['Diagonal Oriente', 'Diagonal Poniente', 'Esperanza']
        : line == 2
            ? ['Estación Línea 2-1', 'Estación Línea 2-2']
            : ['Estación Línea 3-1', 'Estación Línea 3-2'];
  }
}
