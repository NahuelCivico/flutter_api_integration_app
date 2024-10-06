import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final dynamic pokemon;
  final String pokemonId;

  const PokemonDetailScreen(
      {super.key, required this.pokemon, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon['name'].toString().toUpperCase(),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'pokemon-$pokemonId',
              child: Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              pokemon['name'].toString().toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
