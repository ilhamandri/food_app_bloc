import 'package:flutter/material.dart';
import 'package:food_app_bloc/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RouteGenerator _routeGenerator = RouteGenerator();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: _routeGenerator.generateRoute,
    );
  }
}
