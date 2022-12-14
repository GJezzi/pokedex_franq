import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokdedex_franq/models/pokemon_model.dart';
import 'package:pokdedex_franq/services/pokemon_repository.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  List<PokemonModel> pokemonList = [];

  PokemonBloc({required this.pokemonRepository}) : super(IntialState()) {
    on<PokemonRequestEvent>((event, emit) async {
      emit(LoadingState());
      print('LOADING...');

      try {
        pokemonList = await pokemonRepository.getAllPokemon(0);
        emit(SuccessState(pokemon: pokemonList));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
