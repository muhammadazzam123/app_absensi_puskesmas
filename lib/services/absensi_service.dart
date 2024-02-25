import 'dart:io';
import 'package:app_absensi_puskesmas/models/absensi_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbsensiService {
  final String _apiUri = dotenv.get('API_URI');
  final dio = Dio();

  postAbsensi(data, File foto) async {
    try {
      var fullUri = '$_apiUri/api/v1/absensis';
      String fotoName = foto.path.split('/').last;

      final formData = FormData.fromMap({
        'user_id': data['user_id'],
        'foto': await MultipartFile.fromFile(foto.path, filename: fotoName),
        'lokasi': data['lokasi']
      });

      var response = await dio.post(fullUri, data: formData);
      return response.data;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<RiwayatAbsensi>> getAbsensisById() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      var fullUri = '$_apiUri/api/v1/absensis/$userId';
      final response = await dio.get(fullUri);
      // debugPrint(response.data['absensis'].toString());
      return (response.data['absensis'] as List)
          .map((e) => RiwayatAbsensi.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Network Error : $e');
    }
  }

  Future<LatestAbsensi> getLatestAbsensi() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      var fullUri = '$_apiUri/api/v1/latest-absensi/$userId';
      final response = await dio.get(fullUri);
      return LatestAbsensi.fromJson(response.data);
      // debugPrint(tanggalTerakhir);
    } catch (e) {
      throw Exception('Network Error : $e');
    }
  }

  Future<List<RiwayatAbsensi>> getPegawaiAbsensiById(id) async {
    try {
      var fullUri = '$_apiUri/api/v1/absensis/$id';
      final response = await dio.get(fullUri);
      return (response.data['absensis'] as List)
          .map((e) => RiwayatAbsensi.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Network Error : $e');
    }
  }

  Future<List<RiwayatAbsensi>> getAllAbsensi() async {
    try {
      String fullUri = '$_apiUri/api/v1/absensis';
      final response = await dio.get(fullUri);
      return (response.data as List)
          .map((e) => RiwayatAbsensi.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Network Error : $e');
    }
  }
}
