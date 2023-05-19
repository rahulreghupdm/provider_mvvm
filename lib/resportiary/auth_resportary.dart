import 'package:provider_mvvm_architecture/data/Network/baseapiservice.dart';
import 'package:provider_mvvm_architecture/data/Network/networkApisServices.dart';
import 'package:provider_mvvm_architecture/res/app_url.dart';

class AuthRepository {
  BaseApiService apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
