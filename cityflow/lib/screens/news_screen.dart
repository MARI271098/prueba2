import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
      ),
      drawer: const DrawerWidget(), // Menú desplegable
      body: ListView(
        children: [
          Image.asset('assets/noticia.png'), // Espacio para la imagen de noticia
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Operación del servicio Valsequillo-Alpha.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('24 Septiembre 2024,A partir del sábado 28 de septiembre, el servicio troncal Valsequillo-Diagonal se convertirá al servicio Valsequillo-Alpha, se contempla la estación Alpha de Línea 2 como punto de transbordo entre los servicios de Línea 2 y Línea 3. ,El servicio de Línea 3 Valsequillo-Diagonal dejará de operar, por lo que las unidades dejarán de realizar recorrido hasta la Diagonal Defensores de la República. ,En su lugar, con el servicio Valsequillo-Alpha las unidades de Línea 3 provenientes de Valsequillo llegarán a la 11 sur, dando vuelta hacia el sur y acoplando en la estación Alpha, en donde todas las personas usuarias deberán descender de la unidad para transbordar al servicio de Línea 2.,Por su parte las personas provenientes de Línea 2 con destino hacia Terminal Valsequillo deberán utilizar unidades de esa misma Línea para dirigirse a estación Alpha, y realizar en este lugar el ascenso a unidades de Línea 3 con destino al Blvd. Cap. Carlos Camacho Espíritu.'),
          ),
          // Continúa agregando más noticias
        ],
      ),
    );
  }
}
