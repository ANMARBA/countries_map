import 'package:equatable/equatable.dart';

import 'package:countries_map/domain/entities/country/country.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCountries extends HomeState {
  final List<Country> countries;

  GetCountries({required this.countries});

  @override
  List<Object> get props => [countries];
  @override
  String toString() => 'GetCountries { countries: $countries }';
}

class Loading extends HomeState {}

class SearchIsEmpty extends HomeState {}
