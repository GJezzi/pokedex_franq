import 'package:flutter/material.dart';
import 'package:pokdedex_franq/models/ability.dart';
import 'package:pokdedex_franq/models/type.dart';

class DetailsParams {
  DetailsParams({required this.name});

  final String name;
}

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView(
      {super.key,
      required this.name,
      required this.type,
      required this.img,
      required this.abilities});

  final String name;
  final List<TypeModel> type;
  final String img;
  final List<Ability> abilities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(children: [
          Text(name),
          //Text(type),
          Image.network(img),
          //Text(abilities),
        ]),
      ),
    );
  }
}
