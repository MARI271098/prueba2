import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'CityFlow Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map), 
            title: const Text('Mapas'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bus), 
            title: const Text('Líneas'),
            onTap: () {
              // Navegar a las líneas
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle), 
            title: const Text('Mis Tarjetas'),
            onTap: () {
              Navigator.pushNamed(context, '/cards');
            },
          ),
          ListTile(
            leading: const Icon(Icons.article), 
            title: const Text('Noticias'),
            onTap: () {
              Navigator.pushNamed(context, '/news');
            },
          ),
        ],
      ),
    );
  }
}
