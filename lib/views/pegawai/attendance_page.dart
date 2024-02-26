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
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // lokasi bidar
  String locationName = 'Universitas Bina Darma';
  double locationLatitude = -2.9995192;
  double locationLongitude = 104.7680025;
  // lokasi puskesmas
  // String locationName = 'Puskesmas Tanjung Raja';
  // double locationLatitude = 0.0;
  // double locationLongitude = 0.0;
  bool _isLoading = false;
  Future<File>? imageFile;
  File? fotoFile;
  String? fotoName;
  late User _userData;
  late LatestAbsensi _latestAbsensi;
  late Future<List<RiwayatAbsensi>> _riwayatAbsensiData;
  late Future<LatestAbsensi> latestAbsensi;
  late DateFormat dateFormat;
  late DateFormat timeFormat;
  final currentDatetime = DateTime.now();
  late String formattedCurrentDatetime;
  String tombol = "Hadir";

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
    dateFormat = DateFormat.yMd('id');
    timeFormat = DateFormat.Hm('id');
    _riwayatAbsensiData = AbsensiService().getAbsensisById();
    latestAbsensi = AbsensiService().getLatestAbsensi();
    formattedCurrentDatetime =
        dateFormat.format(currentDatetime.toLocal()).toString();
  }

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
      if (context.mounted) Navigator.pop(context);
    } catch (e) {
      _showSnackBar('Error $e');
      setState(() {
        _isLoading = false;
      });
    }
    if (context.mounted && !_isLoading) Navigator.pop(context);
  }

  // getTanggalTerakhir() async {
  //   try {
  //     final response = await AbsensiService().getLatestAbsensi();
  //     final tglTerakhir = response.createdAt;
  //     final formatTglTerakhir =
  //         dateFormat.format(DateTime.parse(tglTerakhir!)).toString();
  //     return formatTglTerakhir;
  //   } catch (e) {
  //     return;
  //   }
  // }

  _sendPresence(int distance) async {
    if (distance <= 400) {
      try {
        _latestAbsensi = await AbsensiService().getLatestAbsensi();
        _userData = await UserService().getUserById();
        var data = {
          'user_id': _userData.id,
          'lokasi': locationName,
        };
        var res;
        if (tombol == 'Hadir') {
          res = await AbsensiService().postAbsensi(data, fotoFile!);
        } else {
          res = await AbsensiService()
              .updateAbsensi(data, fotoFile!, _latestAbsensi.id);
        }
        if (res['success']) {
        } else {
          if (context.mounted) {
            _showSnackBar(res['message']);
          }
        }
      } catch (e) {
        if (context.mounted && !_isLoading) Navigator.pop(context);
        _showSnackBar('Error $e');
      }
    } else {
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

  Widget listAbsen(tanggalAbsen, waktuHadir, waktuPulang, rentangWaktu) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$tanggalAbsen',
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
                '$waktuHadir',
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
                (waktuPulang == waktuHadir) ? '--.--' : '$waktuPulang',
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
                (waktuPulang == waktuHadir) ? '--.--' : '$rentangWaktu',
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

  Widget listOfListAbsen() {
    return FutureBuilder(
        future: _riwayatAbsensiData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final tanggalHadir = dateFormat.format(DateTime.parse(
                        snapshot.data![index].createdAt.toString()));
                    final waktuHadir = timeFormat.format(DateTime.parse(
                            snapshot.data![index].createdAt.toString())
                        .toLocal());
                    final waktuPulang = timeFormat.format(DateTime.parse(
                            snapshot.data![index].updatedAt.toString())
                        .toLocal());
                    final rentangWaktu = DateTime.parse(
                            snapshot.data![index].updatedAt.toString())
                        .difference(DateTime.parse(
                            snapshot.data![index].createdAt.toString()));
                    return listAbsen(tanggalHadir, waktuHadir, waktuPulang,
                        rentangWaktu.toString());
                  }),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Container(
            alignment: Alignment.center,
            child: const Center(child: CircularProgressIndicator()),
          );
        });
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
              listOfListAbsen()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
        child: SizedBox(
          height: 50,
          child: FutureBuilder(
            future: latestAbsensi,
            builder: (context, snapshot) {
              debugPrint(snapshot.hasData.toString());
              if (snapshot.hasData) {
                final formatTglTerakhir = dateFormat
                    .format(DateTime.parse(snapshot.data!.createdAt!))
                    .toString();
                if ((formatTglTerakhir == formattedCurrentDatetime) &&
                    (snapshot.data!.createdAt == snapshot.data!.updatedAt)) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        tombol = "Pulang";
                      });
                      _caputerPhoto();
                    },
                    label: Text(
                      'Pulang',
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
                  );
                } else if ((formatTglTerakhir == formattedCurrentDatetime) &&
                    (snapshot.data!.createdAt != snapshot.data!.updatedAt)) {
                  const Text(
                      "Kamu sudah bekerja dengan baik! Saatnya istirahat untuk mengisi energi kembali dan menjalani hari esok. Semangat!:)");
                } else {
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        tombol = "Hadir";
                      });
                      _caputerPhoto();
                    },
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
                  );
                }
              }
              return ElevatedButton.icon(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
