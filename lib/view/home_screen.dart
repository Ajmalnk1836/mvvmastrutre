import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvmstructre/data/response/status.dart';
import 'package:mvvmstructre/repositery/home_repositery.dart';
import 'package:mvvmstructre/utils/routes/routes_name.dart';
import 'package:mvvmstructre/utils/routes/utils.dart';
import 'package:mvvmstructre/view_model/home_view_mdel.dart';
import 'package:mvvmstructre/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
} 

class _HomescreenState extends State<Homescreen> {
  HomeviewModel homeviewProvider = HomeviewModel();

  @override
  void initState() {
    Homerepositery().getMoviedetails();
    //homeviewProvider.showMOvieItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserviewMOdel>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  provider.removeUser().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: ChangeNotifierProvider<HomeviewModel>(
            create: (context) => HomeviewModel(),
            child: Consumer<HomeviewModel>(
              builder: (context, value, child) {
                switch (value.movieList.status) {
                  case Status.LOADING:
                    return Center(child: const CircularProgressIndicator());
                  case Status.ERROR:
                    return Text(value.movieList.message.toString());

                  case Status.COMPLETED:
                    return ListView.separated(
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                              leading: Image.network(
                                value.movieList.data!.movies![index].posterurl
                                    .toString(),
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  );
                                },
                              ),
                              title: Text(value
                                  .movieList.data!.movies![index].title
                                  .toString()),
                              trailing: Text(Utils.average(value
                                      .movieList.data!.movies![index].ratings!)
                                  .toStringAsFixed(1)));
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: value.movieList.data!.movies!.length);
                }
                return Container();
              },
            )));
  }
}
