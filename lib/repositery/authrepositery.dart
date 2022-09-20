import 'package:mvvmstructre/data/network/baseApisecrives.dart';
import 'package:mvvmstructre/data/network/networkApiservices.dart';
import 'package:mvvmstructre/resourses/app_url.dart';

class Authrepositery {
  BasApiServices _apiservices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responses = _apiservices.postApireponses(AppUrl.loginApi, data);
      return responses;
    } catch (e) {
      throw e;
    }
  }
  

   Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic responses = _apiservices.postApireponses(AppUrl.registerApi, data);
      return responses;
    } catch (e) {
      throw e;
    }
  }
}
