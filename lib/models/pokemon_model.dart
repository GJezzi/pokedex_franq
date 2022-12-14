import 'package:pokdedex_franq/models/ability.dart';
import 'package:pokdedex_franq/models/sprites.dart';
import 'package:pokdedex_franq/models/type.dart';

class PokemonModel {
  final int id;
  final String name;
  final List<TypeModel> types;
  final Sprites sprites;
  final List<Ability> abilities;

  PokemonModel(
      {required this.id,
      required this.name,
      required this.types,
      required this.sprites,
      required this.abilities});

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
      id: json['id'],
      name: json['name'],
      types: List<TypeModel>.from(
          json['types'].map((item) => TypeModel.fromJson(item))),
      sprites: Sprites.fromJson(json["sprites"]),
      abilities: List<Ability>.from(
          json['abilities'].map((item) => Ability.fromJson(item))));
}
