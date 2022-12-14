import 'package:flutter/material.dart';
import 'package:pokdedex_franq/models/pokemon_model.dart';
import 'package:pokdedex_franq/models/species.dart';
import 'package:pokdedex_franq/models/type.dart';

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({super.key, required this.species});

  final Species species;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(species.name),
    );
  }
}
