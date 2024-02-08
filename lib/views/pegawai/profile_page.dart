import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Profile',
              style: openSansTextStyle.copyWith(
                  fontSize: 24, fontWeight: semiBold, color: blackColor),
            ),
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: primaryColor,
          ),
          const SizedBox(height: 5),
          Text(
            'Adelya Agustina',
            style: openSansTextStyle.copyWith(
                fontSize: 14, fontWeight: semiBold, color: blackColor),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Nama',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    ': Adelya Agustina',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'NIP',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                  const SizedBox(width: 35),
                  Text(
                    ': 812378123712',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'TTL',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                  const SizedBox(width: 35),
                  Text(
                    ': Jl Silaberanti Kelurahan 13 ulu Plaju',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Jabatan',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    ': Perawat Senior',
                    style: openSansTextStyle.copyWith(
                        fontSize: 14, color: grayColorDua, fontWeight: regular),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout_outlined,
                    size: 20,
                    color: whiteColor,
                  ),
                  label: Text(
                    'Logout',
                    style: openSansTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
                      color: whiteColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
