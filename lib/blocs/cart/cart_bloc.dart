import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartEmptyState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    // TODO: implement mapEventToState
  }
}

abstract class CartEvent {}

class CheckoutEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {}

abstract class CartState {}

class CartEmptyState extends CartState {}
