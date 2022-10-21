import 'package:flutter/cupertino.dart';
import 'package:mvvmstructre/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserviewMOdel extends ChangeNotifier {
  Future<bool> saveUSer(UserToken token) async {
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.setString("token", token.token.toString());
    notifyListeners();
    return true;
  } 

  Future<UserToken> getUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString("token");

    return UserToken(token: token.toString());
  }
 
  Future<bool> removeUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
    return true;
  }  
}
