import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String countryName;
  final String countryShortName;
  final int countryPhoneCode;

  const Country({
    required this.countryName,
    required this.countryShortName,
    required this.countryPhoneCode,
  });

  @override
  List<Object?> get props => [
        countryName,
        countryShortName,
        countryPhoneCode,
      ];
}
