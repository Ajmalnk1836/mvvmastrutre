import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvmstructre/data/network/networkApiservices.dart';
import 'package:mvvmstructre/models/movie_models.dart';
import 'package:mvvmstructre/repositery/home_repositery.dart';
import 'package:mvvmstructre/view_model/home_view_mdel.dart';

import 'package:mvvmstructre/view_model/services/splash_services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServies servies = SplashServies();
  // // List<movieModelList> movieLists = [];
  // // late Future<movieModelList> futureAlbum;

  // // Future<movieModelList> getMovieList() async {
  // //   final response = await http.get(Uri.parse(
  // //       'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/movies_list'));
  // //   log(response.statusCode.toString());
  // //   if (response.statusCode == 200) {
  // //     log(response.body);
  // //     final responses = jsonDecode(response.body);

  // //     return movieModelList.fromJson(jsonDecode(response.body));
  // //     // Iterable list = finalResponses["movies"];

  // //     // movieLists =
  // //     //     list.map((movies) => movieModelList.fromJson(movies)).toList();
  // //     // log(movieLists[0].movies!.first.title.toString());
  // //     // return movieLists as movieModelList;
  // //   } else {
  // //     throw Exception("dsfsd");
  // //   }
  // }

  @override
  void initState() {
    super.initState();
    //getMovieList();
    // futureAlbum = getMovieList();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      servies.authentication(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HomeviewModel>(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Text(
              "splashscreen",
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        ],
      )),
    );
  }
}
