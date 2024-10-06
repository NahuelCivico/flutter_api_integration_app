import 'package:flutter/material.dart';

class PokemonDrawer extends StatelessWidget {
  const PokemonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = ['Pokédex', 'Favorites', 'Settings'];

    return Drawer(
      backgroundColor: const Color(0xFFEF5350),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Color(0xFFEF5350),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Entrenador Pokémon',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '¡Listo para la aventura!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Menú de navegación
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.white,
                endIndent: 20,
                indent: 20,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.list, color: Colors.white),
                  title: Text(
                    menuItems[index],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFFEF5350),
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
