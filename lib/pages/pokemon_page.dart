import 'package:flutter/material.dart';
import 'package:flutter_api_integration_app/services/pokemon_service.dart';
import 'package:flutter_api_integration_app/widgets/pokemon_card.dart';
import 'package:flutter_api_integration_app/widgets/pokemon_drawer.dart';
import 'package:flutter_api_integration_app/widgets/pokemon_search.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  PokemonPageState createState() => PokemonPageState();
}

class PokemonPageState extends State<PokemonPage> {
  late Future<List<dynamic>> _pokemonList;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pokemonList = fetchPokemon();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke Dex'),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const PokemonDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const PokemonSearch(),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: _pokemonList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final pokemonList = snapshot.data!;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemCount: pokemonList.length,
                        itemBuilder: (context, index) {
                          return PokemonCard(pokemon: pokemonList[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pokédex',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFFEF5350),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 20),
        unselectedLabelStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
