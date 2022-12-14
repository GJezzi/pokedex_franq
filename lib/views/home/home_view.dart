import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokdedex_franq/bloc/pokemon_bloc.dart';
import 'package:pokdedex_franq/models/pokemon_model.dart';
import 'package:pokdedex_franq/services/pokemon_repository.dart';
import 'package:pokdedex_franq/views/details/pokemon_details_view.dart';
import 'package:pokdedex_franq/widgets/pokemon_list_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PokemonModel> pokemonList = [];
  final PokemonRepository pokemonRepository = PokemonRepository();

  @override
  void initState() {
    loadPokemonData();
    super.initState();
  }

  loadPokemonData() async {
    pokemonList = await pokemonRepository.getAllPokemon(0);
    setState(() {
      pokemonList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            );
          } else if (state is SuccessState) {
            return ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return InkWell(
                  child: PokemonListItemWidget(pokemon: pokemon),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PokemonDetailsView(
                                name: pokemon.name,
                                type: pokemon.types,
                                img: pokemon.sprites.frontDefault,
                                abilities: pokemon.abilities,
                              ))),
                );
              },
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.error.toString()));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
