import 'package:flutter/cupertino.dart';
import 'package:mvvmstructre/data/response/api_response.dart';
import 'package:mvvmstructre/models/movie_models.dart';
import 'package:mvvmstructre/repositery/home_repositery.dart';

class HomeviewModel extends ChangeNotifier {
  Homerepositery apiservises = Homerepositery();
  Apiresponse<movieModelList> movieList = Apiresponse.loading();

  //setter method, passing a generic response
  setMovieList(Apiresponse<movieModelList> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> showMOvieItems() async {
    setMovieList(Apiresponse.loading());
    apiservises.getMoviedetails().then((value) {
      setMovieList(Apiresponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(Apiresponse.error(error.toString()));
    });  
  }
} 
