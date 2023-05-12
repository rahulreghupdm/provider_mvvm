import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm_architecture/data/response/api_response.dart';
import 'package:provider_mvvm_architecture/model/details.dart';
import 'package:provider_mvvm_architecture/resportiary/home_respository.dart';

class HomeViewViewmodel with ChangeNotifier {
  final _myRapo = HomeRepositary();

  ApiResponse<Welcome> detailsList = ApiResponse.loading();

  setDetailsList(ApiResponse<Welcome> response) {
    detailsList = response;
    notifyListeners();
  }

  Future<void> fetchDetailsListApi() async {
    setDetailsList(ApiResponse.loading());

    _myRapo.fetchDetailsList().then((value) {
      setDetailsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setDetailsList(ApiResponse.error(error.toString()));
    });
  }
}
