import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState?> {
  List<Country> _countries = [];
  final HomeRepository _homeRepository = HomeRepositoryImpl();

  List<Country> get countries => _countries;

  HomeBloc() : super(null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStarted) {
      yield Loading();
      try {
        final token = await _homeRepository.getAccessToken();
        _countries = await _homeRepository.getCountries(token: token);
        if (countries.isNotEmpty) {
          yield GetCountries(countries: countries);
        } else {
          yield GetCountries(countries: const []);
        }
      } catch (e) {
        yield GetCountries(countries: const []);
      }
    } else if (event is HomeSearch) {
      yield Loading();

      List<Country> countries = [];
      for (var country in this.countries) {
        List<String> list = [country.countryName];
        bool results = list.any((element) =>
            (element.toLowerCase().contains(event.search.toLowerCase())));
        if (results) {
          countries.add(country);
        }
      }
      if (countries.isNotEmpty) {
        yield GetCountries(countries: countries);
      } else {
        yield SearchIsEmpty();
      }
    }
  }
}
