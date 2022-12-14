import 'package:pokdedex_franq/models/species.dart';

class Ability {
  final Species ability;
  final bool isHidden;
  final int slot;

  Ability({required this.ability, required this.isHidden, required this.slot});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
      ability: Species.fromJson(json['ability']),
      isHidden: json['is_hidden'],
      slot: json['slot']);
}
