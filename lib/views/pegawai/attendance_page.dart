import 'dart:io';

import 'package:app_absensi_puskesmas/models/absensi_model.dart';
import 'package:app_absensi_puskesmas/models/user_model.dart';
import 'package:app_absensi_puskesmas/services/absensi_service.dart';
import 'package:app_absensi_puskesmas/services/location_service.dart';
import 'package:app_absensi_puskesmas/services/user_service.dart';
import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // lokasi bidar
  String locationName = 'Universitas Bina Darma';
  double locationLatitude = -2.9634624;
  double locationLongitude = 104.7317928;
  // lokasi puskesmas
  // String locationName = 'Puskesmas Tanjung Raja';
  // double locationLatitude = 0.0;
  // double locationLongitude = 0.0;
  bool _isLoading = false;
  Future<File>? imageFile;
  File? fotoFile;
  String? fotoName;
  late User _userData;

  _showSnackBar(String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Sedang validasi lokasi',
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                      strokeWidth: 7,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _checkDistance() async {
    _showMyDialog();
    try {
      setState(() {
        _isLoading = true;
      });
      await LocationService().checkLocationPermission();
      Position userCurrentPosition =
          await LocationService().getUserCurrentPosition();
      double distance = Geolocator.distanceBetween(userCurrentPosition.latitude,
          userCurrentPosition.longitude, locationLatitude, locationLongitude);
      _sendPresence(distance.round());
    } catch (e) {
      _showSnackBar('Error $e');
      setState(() {
        _isLoading = false;
      });
    }
    if (context.mounted && !_isLoading) Navigator.pop(context);
  }

  _sendPresence(int distance) async {
    if (distance <= 100) {
      try {
        _userData = await UserService().getUserById();
        var data = {
          'user_id': _userData.id,
          'lokasi': locationName,
        };
        var res = await AbsensiService().postAbsensi(data, fotoFile!);
        if (res['success']) {
          if (context.mounted) {
            Navigator.pushReplacementNamed(
              context,
              '/hasil-absensi',
              arguments: HasilArguments(_userData, locationName, fotoFile!),
            );
          }
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        if (context.mounted && !_isLoading) Navigator.pop(context);
        _showSnackBar('Error $e');
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      _showSnackBar('Kamu berada di luar Jangkauan ($distance meter)');
    }
  }

  _caputerPhoto() async {
    final ImagePicker picker = ImagePicker();
    XFile? capturedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 400,
        maxWidth: 400);
    if (capturedFile == null) return;
    fotoFile = File(capturedFile.path);
    setState(() {
      fotoName = fotoFile!.path.split('/').last;
    });
    _checkDistance();
  }

  Widget listAbsen() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12/06/2024',
                style: openSansTextStyle.copyWith(
                    fontSize: 12, fontWeight: regular, color: blackColor),
              ),
              const SizedBox(width: 25),
              Icon(
                Icons.outbond_outlined,
                size: 16,
                color: greenColor,
              ),
              const SizedBox(width: 5),
              Text(
                '08.30',
                style: openSansTextStyle.copyWith(
                    fontSize: 12, fontWeight: regular, color: blackColor),
              ),
              const SizedBox(width: 25),
              Icon(
                Icons.arrow_circle_up_outlined,
                size: 16,
                color: greenColor,
              ),
              const SizedBox(width: 5),
              Text(
                '08.30',
                style: openSansTextStyle.copyWith(
                    fontSize: 12, fontWeight: regular, color: blackColor),
              ),
              const SizedBox(width: 25),
              Icon(
                Icons.access_time_outlined,
                size: 16,
                color: greenColor,
              ),
              const SizedBox(width: 5),
              Text(
                '8h 30ms',
                style: openSansTextStyle.copyWith(
                    fontSize: 12, fontWeight: regular, color: blackColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(
            color: grayColor,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Attendance',
                style: openSansTextStyle.copyWith(
                    fontSize: 24, fontWeight: semiBold, color: blackColor),
              ),
              const SizedBox(height: 20),
              Text(
                'Riwayat Absen',
                style: openSansTextStyle.copyWith(
                    fontSize: 14, fontWeight: semiBold, color: blackColor),
              ),
              listAbsen(),
              listAbsen(),
              listAbsen(),
              listAbsen(),
              listAbsen(),
              listAbsen(),
              listAbsen(),
              listAbsen(),
              listAbsen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
        child: SizedBox(
          height: 50,
          child: ElevatedButton.icon(
            onPressed: _caputerPhoto,
            label: Text(
              'Hadir',
              style: openSansTextStyle.copyWith(
                fontSize: 15,
                fontWeight: regular,
                color: whiteColor,
              ),
            ),
            icon: Icon(Icons.camera_alt_rounded, color: whiteColor),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
