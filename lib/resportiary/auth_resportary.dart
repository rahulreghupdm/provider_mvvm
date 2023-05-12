import 'package:provider_mvvm_architecture/data/Network/baseapiservice.dart';
import 'package:provider_mvvm_architecture/data/Network/networkApisServices.dart';
import 'package:provider_mvvm_architecture/res/app_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
