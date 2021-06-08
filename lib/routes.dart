import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/blocs/catalog/catalog_bloc.dart';
import 'package:food_app_bloc/views/catalog/catalog_screen.dart';
import 'package:food_app_bloc/views/detail/detail_screen.dart';

class RouteGenerator {
  final CatalogBloc _catalogBloc = CatalogBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _catalogBloc..add(LoadDataEvent()),
            child: CatalogScreen(),
          ),
        );
        break;
      case '/detail':
        return MaterialPageRoute(
          builder: (context) => DetailScreen(),
          settings: RouteSettings(
            arguments: arguments,
          ),
        );
        break;
      default:
        return null;
    }
  }
}
