import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmstructre/models/user_model.dart';
import 'package:mvvmstructre/utils/routes/routes_name.dart';
import 'package:mvvmstructre/view_model/user_view_model.dart';

class SplashServies {
  Future<UserToken> _getuser() => UserviewMOdel().getUser();

  void authentication(BuildContext context) async {
    _getuser().then((value) {
      log(value.token.toString());
      if (value.token == null || value.token == '') {
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        log(error.toString());
      }
    });
  }
}
