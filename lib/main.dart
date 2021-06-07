import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/blocs/catalog/catalog_bloc.dart';
import 'package:food_app_bloc/views/catalog/catalog_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CatalogBloc>(
        create: (context) => CatalogBloc()..add(LoadDataEvent()),
        child: CatalogScreen(),
      ),
    );
  }
}
