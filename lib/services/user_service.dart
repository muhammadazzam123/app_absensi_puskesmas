import 'package:app_absensi_puskesmas/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String _apiUri = dotenv.get('API_URI');
  final dio = Dio();

  Future<User> getUserById() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      var fullUri = '$_apiUri/api/v1/users/$userId';
      final response = await dio.get(fullUri);
      return User.fromJson(response.data['user']);
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception('Network Error : $e');
    }
  }

  changePassword(data) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      var fullUri = '$_apiUri/v1/ganti-password/$userId';
      final response = await dio.post(fullUri, data: data);
      return response.data;
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception('Network Error : $e');
    }
  }

  Future<List<User>> getAllUser() async {
    try {
      String fullUri = '$_apiUri/api/v1/users';
      final response = await dio.get(fullUri);
      return (response.data as List).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Network Error : $e');
    }
  }

  addUser(data) async {
    try {
      var fullUri = '$_apiUri/api/v1/users/';
      final response = await dio.post(fullUri, data: data);
      return response.data;
    } catch (e) {
      throw Exception('Network Error : $e');
    }
  }

  editUser(data) async {
    try {
      var fullUri = '$_apiUri/api/v1/users/';
      final response = await dio.put(fullUri, data: data);
      return response.data;
    } catch (e) {
      throw Exception('Network Error : $e');
    }
  }
}
