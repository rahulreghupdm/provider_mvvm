import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_mvvm_architecture/model/user_model.dart';
import 'package:provider_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:provider_mvvm_architecture/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
       
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
