class PokemonAddressModel {
  final String name;
  final String url;

  PokemonAddressModel({required this.name, required this.url});

  factory PokemonAddressModel.fromJson(Map<String, dynamic> json) =>
      PokemonAddressModel(name: json['name'], url: json['url']);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
