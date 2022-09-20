import 'package:flutter/material.dart';
import 'package:mvvmstructre/utils/routes/routes.dart';
import 'package:mvvmstructre/utils/routes/routes_name.dart';
import 'package:mvvmstructre/view/login_screen.dart';
import 'package:mvvmstructre/view_model/auth_view_mode.dart';
import 'package:mvvmstructre/view_model/home_view_mdel.dart';
import 'package:mvvmstructre/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserviewMOdel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeviewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
