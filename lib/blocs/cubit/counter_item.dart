import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/models/product.dart';

class CounterItemCubit extends Cubit<int> {
  Product product;
  CounterItemCubit({this.product}) : super(1);

  void incrementItem() {
    if (state <= product.qty) {
      emit(state + 1);
    }
  }

  void decrementItem() {
    if (state > 1 && state != 0) {
      emit(state - 1);
    }
  }
}
