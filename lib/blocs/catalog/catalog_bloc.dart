import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(CatalogState initialState) : super(initialState);

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) {}
}

abstract class CatalogEvent {}

abstract class CatalogState {}
