import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_architecture/model/user_model.dart';
import 'package:provider_mvvm_architecture/resportiary/auth_resportary.dart';
import 'package:provider_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:provider_mvvm_architecture/utils/utility.dart';
import 'package:provider_mvvm_architecture/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRapo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRapo.loginApi(data).then((value) {
      setLoading(false);

      final userPrefernce = Provider.of<UserViewModel>(context, listen: false);
      userPrefernce.saveUser(UserModel(token: value['token'].toString()));

      Utility.flushBarMessanger('LogIn SuccesFul', context);
      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(value.runtimeType);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utility.flushBarMessanger(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
