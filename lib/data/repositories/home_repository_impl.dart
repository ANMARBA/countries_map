import 'package:countries_map/data/services/home_service_impl.dart';
import 'package:countries_map/domain/entities/country/country.dart';
import 'package:countries_map/domain/repositories/home_repository.dart';
import 'package:countries_map/domain/services/home_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService homeService = HomeServiceImpl();

  @override
  Future<String> getAccessToken() async {
    return await homeService.getAccessToken();
  }

  @override
  Future<List<Country>> getCountries({required String token}) async {
    return await homeService.getCountries(token: token);
  }
}
