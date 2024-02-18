import 'package:app_absensi_puskesmas/views/admin/add_pegawai.dart';
import 'package:app_absensi_puskesmas/views/admin/detail_pegawai_admin.dart';
import 'package:app_absensi_puskesmas/views/admin/edit_pegawai.dart';
import 'package:app_absensi_puskesmas/views/admin/home_page_admin.dart';
import 'package:app_absensi_puskesmas/views/login_page.dart';
import 'package:app_absensi_puskesmas/views/pegawai/attendance_page.dart';
import 'package:app_absensi_puskesmas/views/pegawai/buttom_navbar.dart';
import 'package:app_absensi_puskesmas/views/pegawai/home_page.dart';
import 'package:app_absensi_puskesmas/views/pegawai/profile_page.dart';
import 'package:app_absensi_puskesmas/views/pimpinan/absensi_pegawai.dart';
import 'package:app_absensi_puskesmas/views/pimpinan/buttom_navbar_pimpinan.dart';
import 'package:app_absensi_puskesmas/views/pimpinan/data_detail_pegawai.dart';
import 'package:app_absensi_puskesmas/views/pimpinan/data_pegawai.dart';
import 'package:app_absensi_puskesmas/views/pimpinan/detail_absensi_pegawai.dart';
import 'package:app_absensi_puskesmas/views/pimpinan/home_pimpinan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Absensi Puskesmas',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/bottom-navbar': (context) => const ButtomNavbar(),
        '/home-page': (context) => const HomePage(),
        '/attendance-page': (context) => const AttendancePage(),
        '/profile': (context) => const ProfilePage(),
        '/bottom-navbar-pimpinan': (context) => const ButtomNavbarPimpinan(),
        '/home-page-pimpinan': (context) => const HomePagePimpinan(),
        '/data-pegawai': (context) => const DataPegawai(),
        '/data-detail-pegawai': (context) => const DataDetailPegawai(),
        '/absen-pegawai': (context) => const ReportAbsenPegawai(),
        '/absen-pegawai-detail': (context) => const DetailReportAbsenPegawai(),
        '/home-page-admin': (context) => const HomePageAdmin(),
        '/edit-pegawai': (context) => const EditPegawai(),
        '/add-pegawai': (context) => const AddPegawai(),
        '/detail-pegawai-admin': (context) => const DetailPegawaiAdmin(),
      },
    );
  }
}
