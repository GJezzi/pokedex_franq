import 'package:dio/dio.dart';
import 'package:pokdedex_franq/models/pokemon_address_model.dart';
import 'package:pokdedex_franq/models/pokemon_model.dart';

class PokemonRepository {
  static final Dio dio = Dio();

  static const _baseApi = 'https://pokeapi.co/api/v2/';
  static const pokemonEndpoint = '$_baseApi/pokemon';

  Future<List<PokemonModel>> getAllPokemon(int pageIndex) async {
    try {
      final queryParams = {
        'limit': '200',
        'offset': (pageIndex * 200).toString()
      };

      Response response =
          await dio.get(pokemonEndpoint, queryParameters: queryParams);

      final pokemonResultResponse = response.data;

      List<PokemonAddressModel> pokemonResult = pokemonResultResponse['results']
          .map<PokemonAddressModel>(
              (resultPokemon) => PokemonAddressModel.fromJson(resultPokemon))
          .toList();

      final pokemons = <PokemonModel>[];
      for (var pokemon in pokemonResult) {
        pokemons.add(await getPokemon(pokemon.name));
      }

      return pokemons;
    } catch (e) {
      throw Error();
    }
  }

  Future<PokemonModel> getPokemon(String name) async {
    try {
      Response response = await dio.get('$pokemonEndpoint/$name');
      final pokemonResponse = response.data;

      return PokemonModel.fromJson(pokemonResponse);
    } catch (e) {
      throw Error();
    }
  }

  Future<PokemonModel> getPokemonSpecies(String name) async {
    try {
      Response response = await dio.get('$pokemonEndpoint-species/$name');
      final pokemonSpecies = response.data;

      return PokemonModel.fromJson(pokemonSpecies);
    } catch (e) {
      throw Error();
    }
  }
}
