import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent([List props = const []]) : super();
}

class HomeStarted extends HomeEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() => 'HomeStarted';
}

class HomeSearch extends HomeEvent {
  final String search;

  const HomeSearch({
    required this.search,
  });

  @override
  List<Object?> get props => [
        search,
      ];
}
