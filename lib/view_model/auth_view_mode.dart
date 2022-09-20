import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmstructre/models/user_model.dart';
import 'package:mvvmstructre/repositery/authrepositery.dart';
import 'package:mvvmstructre/utils/routes/routes_name.dart';
import 'package:mvvmstructre/utils/routes/utils.dart';
import 'package:mvvmstructre/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel extends ChangeNotifier {
  final _myrepo = Authrepositery();

  bool _loading = false;

  bool get loading => _loading;
  void setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }

  Future<dynamic> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserviewMOdel>(context, listen: false);
      userPreference.saveUSer(UserToken(token: value['token'].toString()));
      Navigator.pushNamed(context, RoutesName.home);
      Utils.errorFlushbarMessage("Login successfully", context);
      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.errorFlushbarMessage("Login failed", context);
        log(error.toString());
      }
    });
  }

  Future<dynamic> registerApi(dynamic data, BuildContext context) async {
    setLoading(true);
    await _myrepo.registerApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.login);
      Utils.errorFlushbarMessage("register success", context);
      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.errorFlushbarMessage(error.toString(), context);
      }
    });
  }
}
