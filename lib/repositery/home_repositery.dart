import 'dart:convert';
import 'dart:developer';

import 'package:mvvmstructre/data/network/baseApisecrives.dart';
import 'package:mvvmstructre/data/network/networkApiservices.dart';
import 'package:mvvmstructre/models/movie_models.dart';
import 'package:mvvmstructre/resourses/app_url.dart';
import 'package:http/http.dart' as http;

class Homerepositery {
  BasApiServices apiservices = NetworkApiServices();
  late movieModelList movieCollection;
  List<movieModelList> list = [];
  Future<movieModelList> getMoviedetails() async {
    try {
      dynamic responses =
          apiservices.getApiResponses(AppUrl.moviesListEndPoint);
      log(responses);

      return responses = movieModelList.fromJson(responses);
    } catch (e) {
      rethrow;
    }
  }

  Future<movieModelList> getDatas() async {
    try {
      //  final client = http.Client();
      final response = await http.get(Uri.parse(
          "https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/movies_list"));
  
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        //  Map<String, dynamic> movieCollection = new Map<String, dynamic>.from(json.decode(response.body));
        //   log(movieCollection.toString());
        final responses = jsonDecode(response.body);
        movieCollection = movieModelList.fromJson(responses);
        // log(response.body);
        // Iterable data = fresponse["results"];
        // movieCollection =
        //     data.map((datas) => movieModelList.fromJson(datas)).toList();
        // log(movieCollection.toString());
        // log(movieCollection.length.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return movieCollection;
  }
}
