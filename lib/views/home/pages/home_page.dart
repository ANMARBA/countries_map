import 'package:flutter/material.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchQueryController = TextEditingController();

  @override
  void dispose() {
    _searchQueryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(HomeStarted()),
      child: Scaffold(
        appBar: SarchAppbar(searchQueryController: _searchQueryController),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState?>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetCountries) {
                if (state.countries.isEmpty) {
                  return const Center(
                    child: Text('No hay países.'),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (_, i) {
                      return ViewCountry(country: state.countries[i]);
                    },
                    itemCount: state.countries.length,
                  );
                }
              } else {
                return const Center(
                  child:
                      Text('No se encontraron resultados según la búsqueda.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
