import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokdedex_franq/bloc/pokemon_bloc.dart';
import 'package:pokdedex_franq/services/pokemon_repository.dart';
import 'package:pokdedex_franq/views/home/home_view.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc(pokemonRepository: PokemonRepository())
                  ..add(PokemonRequestEvent()))
      ], child: const HomeScreen()),
    );
  }
}
