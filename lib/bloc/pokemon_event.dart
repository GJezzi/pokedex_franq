part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class PokemonRequestEvent extends PokemonEvent {
  @override
  List<Object> get props => [];
}
