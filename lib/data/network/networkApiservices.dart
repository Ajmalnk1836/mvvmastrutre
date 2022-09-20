import 'dart:convert';
import 'dart:io';

import 'package:mvvmstructre/data/app_exception.dart';
import 'package:mvvmstructre/data/network/baseApisecrives.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BasApiServices {
  @override
  Future getApiResponses(String url) async {
    dynamic finalResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      finalResponse = returnResponses(response);
    } on SocketException {
      throw FetchDataExceptions("No intenet Connection");
    }
    return finalResponse;
  }

  @override
  Future postApireponses(String url, dynamic data) async {
    dynamic jsonResponses;

    try {
      final response = await http.post(Uri.parse(url), body: data);
      jsonResponses = returnResponses(response);
    } on SocketException {
      throw FetchDataExceptions("No internet problem");
    }
    return jsonResponses;
  }

  dynamic returnResponses(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadrequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataExceptions(
            "Error occured while communicatin with servers ${response.statusCode.toString()}");
    }
  }
}
