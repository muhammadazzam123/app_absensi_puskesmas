import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String _apiUri = dotenv.get('API_URI');
  final dio = Dio();

  var token = '';

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token').toString();
  }

  authLogin(data) async {
    try {
      var fullUri = '$_apiUri/api/v1/login';
      final response = await dio.post(fullUri, data: data);
      return response.data;
    } on DioException catch (e) {
      return e.message;
    }
  }

  authLogout() async {
    try {
      var fullUri = '$_apiUri/api/v1/logout';
      await _getToken();
      var response = await dio.post(fullUri,
          options: Options(headers: {
            Headers.contentTypeHeader: 'application/json',
            Headers.acceptHeader: 'application/json',
            "Authorization": 'Bearer $token'
          }));
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
