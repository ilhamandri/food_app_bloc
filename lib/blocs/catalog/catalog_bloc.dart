import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/models/banner.dart';
import 'package:food_app_bloc/service/data_service.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final _dataService = DataService();
  CatalogBloc() : super(LoadingData());

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is LoadDataEvent) {
      print('============ Loading Data =============');
      yield LoadingData();
      print('=== === === === === === ===');
      try {
        final banners = await _dataService.fetchBannerImage();
        yield SuccessLoadData(banners: banners);
      } catch (e) {
        yield FailedToLoadData(error: e);
      }
    }
  }
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
