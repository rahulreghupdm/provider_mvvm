import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_architecture/model/user_model.dart';
import 'package:provider_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:provider_mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider_mvvm_architecture/view_model/user_view_model.dart';

import 'utils/routes/routes.dart';

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
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
