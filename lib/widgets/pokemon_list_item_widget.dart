import 'package:flutter/material.dart';
import 'package:pokdedex_franq/models/pokemon_model.dart';
import 'package:pokdedex_franq/widgets/pokemon_type_widget.dart';

class PokemonListItemWidget extends StatelessWidget {
  const PokemonListItemWidget({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Text(pokemon.name),
          Row(
            children: [
              Column(
                children: pokemon.types
                    .map((e) => PokemonTypeWidget(
                          species: e.type,
                        ))
                    .toList(),
              ),
              Image.network(pokemon.sprites.frontDefault)
            ],
          )
        ],
      ),
    );
  }
}
