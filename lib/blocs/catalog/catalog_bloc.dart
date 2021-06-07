import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/models/banner.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(LoadingData());

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) {}
}

abstract class CatalogEvent {}

class LoadDataEvent extends CatalogEvent {}

abstract class CatalogState {}

class SuccessLoadData extends CatalogState {
  List<Banner> banners;
  SuccessLoadData({this.banners});
}

class FailedToLoadData extends CatalogState {
  Error error;
  FailedToLoadData({this.error});
}

class LoadingData extends CatalogState {}
