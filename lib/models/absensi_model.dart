import 'dart:io';

import 'package:app_absensi_puskesmas/models/user_model.dart';

class HasilArguments {
  final User user;
  final String locationName;
  final File fotoFile;

  HasilArguments(this.user, this.locationName, this.fotoFile);
}

class RiwayatAbsensi {
  int? id;
  int? userId;
  String? foto;
  String? createdAt;
  String? updatedAt;

  RiwayatAbsensi(
      {this.id, this.userId, this.foto, this.createdAt, this.updatedAt});

  RiwayatAbsensi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    foto = json['foto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['foto'] = foto;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class LatestAbsensi {
  int? id;
  int? userId;
  String? foto;
  String? createdAt;
  String? updatedAt;

  LatestAbsensi(
      {this.id, this.userId, this.foto, this.createdAt, this.updatedAt});

  LatestAbsensi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    foto = json['foto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['foto'] = foto;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}