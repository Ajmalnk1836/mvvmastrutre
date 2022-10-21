import 'package:flutter/cupertino.dart';
import 'package:mvvmstructre/data/response/api_response.dart';
import 'package:mvvmstructre/models/movie_models.dart';
import 'package:mvvmstructre/repositery/home_repositery.dart';
import 'package:http/http.dart' as http;

class HomeviewModel extends ChangeNotifier {
  Homerepositery apiservises = Homerepositery();
  late movieModelList movieCollection;
  Apiresponse<movieModelList> movieList = Apiresponse.loading();

  //setter method, passing a generic response
  setMovieList(Apiresponse<movieModelList> response) {
    movieList = response;
    notifyListeners();
  }

  Future<dynamic> showMOvieItems() async {
    setMovieList(Apiresponse.loading());
    apiservises.getMoviedetails().then((value) {
      setMovieList(Apiresponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(Apiresponse.error(error.toString()));
    });
  }

  late movieModelList list;
  Future<movieModelList> showMovies() async {
    list = await apiservises.getDatas();

    return list;
  }
}
