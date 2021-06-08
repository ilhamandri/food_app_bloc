import 'dart:convert';

import 'package:food_app_bloc/models/banner.dart';
import 'package:food_app_bloc/models/product.dart';
import 'package:http/http.dart' as http;

class DataService {
  String _baseUrl = 'https://private-3f7641-myfood2.apiary-mock.com/';

  Future<List<Banner>> fetchBannerImage() async {
    try {
      Map<String, String> headers = Map<String, String>();
      headers['Content-Type'] = 'application/json';

      final url = Uri.parse(_baseUrl + 'banner');
      print('banner url : $url');

      final response = await http.get(url);
      print('product response : ${response.statusCode}');

      final json = jsonDecode(response.body);
      final dataBanner = json['data'] as List;
      final banners = dataBanner.map((e) => Banner.fromJson(e)).toList();
      return banners;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Product>> fetchProduct() async {
    try {
      Map<String, String> headers = Map<String, String>();
      final url = Uri.parse(_baseUrl + 'products');
      print('product url: $url');
      final response = await http.get(url, headers: headers);
      print('product response : ${response.statusCode}');
      final json = jsonDecode(response.body);
      final dataProduct = json['data'] as List;
      final products = dataProduct.map((e) => Product.fromJson(e)).toList();
      return products;
    } catch (e) {
      throw e;
    }
  }
}
