import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchPokemon() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['results'];
  } else {
    throw Exception('Error al cargar los Pokémon');
  }
}
