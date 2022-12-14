import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokdedex_franq/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<String> {
  PokemonDetailsCubit pokemonDetailsCubit;
  NavCubit({required this.pokemonDetailsCubit}) : super('');

  void showPokemonDetails(String pokemonName) {
    pokemonDetailsCubit.getPokemonDetails(pokemonName);
    emit(pokemonName);
  }

  void popToHome() {
    emit('');
  }
}
