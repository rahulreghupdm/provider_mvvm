import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_mvvm_architecture/data/Network/baseapiservice.dart';
import 'package:provider_mvvm_architecture/data/app_expection.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FectchDataExpection('No internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FectchDataExpection('No internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestExpection(response.body.toString());
      case 404:
        throw UnauthorizedExpection(response.body.toString());
      default:
        throw FectchDataExpection(
            'Error Occureed with communicatw with server ' +
                'with statuscode' +
                response.statusCode.toString());
    }
  }
}
