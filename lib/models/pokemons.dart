import 'dart:convert';

import 'package:pokdedex_franq/models/pokemon_model.dart';
import 'package:pokdedex_franq/models/pokemon_result_model.dart';

class Pokemons {
  List<PokemonModel> pokemons = [];

  Pokemons.fromJson(List<dynamic> json) {
    if (json == null) return;

    json.forEach((item) {
      final pokemon = PokemonModel.fromJson(item);
      pokemons.add(pokemon);
    });
  }

  PokemonModel pokemonFromJson(String str) =>
      PokemonModel.fromJson(json.decode(str));
}
