import 'package:pokdedex_franq/models/species.dart';

class TypeModel {
  final int slot;
  final Species type;

  TypeModel({required this.slot, required this.type});

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      TypeModel(slot: json['slot'], type: Species.fromJson(json['type']));
}
