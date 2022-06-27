import 'package:countries_map/domain/entities/country/country.dart';

class CountryModel {
  Country fromJson(Map<String, dynamic> json) => Country(
        countryName: json["country_name"] as String,
        countryShortName: json["country_short_name"] as String,
        countryPhoneCode: json["country_phone_code"] as int,
      );
}
