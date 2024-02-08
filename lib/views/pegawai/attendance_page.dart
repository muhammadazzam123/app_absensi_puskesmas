import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

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
            onPressed: () {},
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
