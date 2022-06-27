import 'package:flutter/material.dart';

import '../home.dart';

class SarchAppbar extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final TextEditingController searchQueryController;

  const SarchAppbar({
    Key? key,
    required this.searchQueryController,
    this.height = kToolbarHeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<HomeBloc>(context),
      child: AppBar(
        title: TextField(
          controller: searchQueryController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Buscar país...',
            hintStyle: TextStyle(color: Colors.black),
          ),
          textInputAction: TextInputAction.search,
          onChanged: (String search) {
            context.read<HomeBloc>().add(HomeSearch(search: search));
          },
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
