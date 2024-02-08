import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:app_absensi_puskesmas/views/pegawai/attendance_page.dart';
import 'package:app_absensi_puskesmas/views/pegawai/profile_page.dart';
import 'package:app_absensi_puskesmas/views/pimpinan/home_pimpinan_page.dart';
import 'package:flutter/material.dart';

class ButtomNavbarPimpinan extends StatefulWidget {
  const ButtomNavbarPimpinan({Key? key}) : super(key: key);

  @override
  State<ButtomNavbarPimpinan> createState() => _ButtomNavbarState();
}

class _ButtomNavbarState extends State<ButtomNavbarPimpinan> {
  int _triger = 0;
  void _itemClick(int index) {
    setState(() {
      _triger = index;
    });
  }

  final _listPage = [
    const HomePagePimpinan(),
    const AttendancePage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 74,
          child: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: grayColor,
            unselectedIconTheme: const IconThemeData(size: 30),
            unselectedLabelStyle:
                openSansTextStyle.copyWith(fontSize: 15, fontWeight: regular),
            selectedIconTheme: IconThemeData(color: primaryColor, size: 30),
            selectedItemColor: primaryColor,
            selectedLabelStyle: openSansTextStyle.copyWith(
              color: primaryColor,
              fontSize: 15,
              fontWeight: regular,
            ),
            onTap: _itemClick,
            currentIndex: _triger,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fit_screen_sharp), label: "Attendace"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
        body: _listPage.elementAt(_triger),
      ),
    );
  }
}
