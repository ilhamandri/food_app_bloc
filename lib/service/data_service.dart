import 'package:food_app_bloc/models/banner.dart';
import 'package:http/http.dart' as http;

class DataService {
  String _baseUrl = 'https://private-3f7641-myfood2.apiary-mock.com/';

  Future<List<Banner>> fetchBannerImage() async {
    Map<String, String> headers;
    headers['Content-Type'] = 'application/json';

    var url = Uri.parse(_baseUrl + 'banner');
    var response = await http.get(url, headers: headers);
    print(response.body);
  }
}
