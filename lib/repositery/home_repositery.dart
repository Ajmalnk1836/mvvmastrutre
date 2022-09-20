import 'dart:developer';

import 'package:mvvmstructre/data/network/baseApisecrives.dart';
import 'package:mvvmstructre/data/network/networkApiservices.dart';
import 'package:mvvmstructre/models/movie_models.dart';
import 'package:mvvmstructre/resourses/app_url.dart';

class Homerepositery {
  BasApiServices apiservices = NetworkApiServices();

  Future<movieModelList> getMoviedetails() async {
    try {
      dynamic responses =
          apiservices.getApiResponses(AppUrl.moviesListEndPoint);

      return responses = movieModelList.fromJson(responses);
    } catch (e) {
      throw e;
    }
  }
}
