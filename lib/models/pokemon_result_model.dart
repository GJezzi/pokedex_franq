import 'package:pokdedex_franq/models/pokemon_address_model.dart';

class PokemonResultModel {
  final int count;
  final String previous;
  final String next;
  final List<PokemonAddressModel> results;

  PokemonResultModel(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  factory PokemonResultModel.fromJson(Map<String, dynamic> json) =>
      PokemonResultModel(
        count: json['count'],
        previous: json['previous'],
        next: json['next'],
        results: List<PokemonAddressModel>.from(
            json['results'].map((item) => PokemonAddressModel.fromJson(item))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "previous": previous,
        'next': next,
        "results": results,
      };
}
