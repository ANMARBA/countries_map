import 'package:flutter/material.dart';

import 'package:countries_map/commons/widgets/view_map_widget.dart';
import 'package:countries_map/domain/entities/country/country.dart';

class ViewCountry extends StatelessWidget {
  final Country country;
  const ViewCountry({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewMap()),
            );
          },
          icon: const Icon(Icons.place),
        ),
        title: Column(
          children: [
            Text(country.countryName),
            Text(country.countryShortName),
            Text('${country.countryPhoneCode}'),
          ],
        ),
      ),
    );
  }
}
