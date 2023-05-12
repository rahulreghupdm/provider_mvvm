import 'package:provider_mvvm_architecture/model/details.dart';

import '../data/Network/baseapiservice.dart';
import '../data/Network/networkApisServices.dart';
import '../res/app_url.dart';

class HomeRepositary {
  BaseApiService _apiService = NetworkApiService();
  Future<Welcome> fetchDetailsList() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.detailsUrlEndPoint);
      return response = Welcome.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
