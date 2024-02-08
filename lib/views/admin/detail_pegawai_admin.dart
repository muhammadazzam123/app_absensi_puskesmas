import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class DetailPegawaiAdmin extends StatelessWidget {
  const DetailPegawaiAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Data Pegawai',
            style: openSansTextStyle.copyWith(
                fontSize: 16, fontWeight: semiBold, color: blackColor),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 22,
                  color: blackColor,
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
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
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        ': Adelya Agustina',
                        style: openSansTextStyle.copyWith(
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'NIP',
                        style: openSansTextStyle.copyWith(
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                      const SizedBox(width: 35),
                      Text(
                        ': 812378123712',
                        style: openSansTextStyle.copyWith(
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'TTL',
                        style: openSansTextStyle.copyWith(
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                      const SizedBox(width: 35),
                      Text(
                        ': Jl Silaberanti Kelurahan 13 ulu Plaju',
                        style: openSansTextStyle.copyWith(
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Jabatan',
                        style: openSansTextStyle.copyWith(
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        ': Perawat Senior',
                        style: openSansTextStyle.copyWith(
                            fontSize: 14,
                            color: grayColorDua,
                            fontWeight: regular),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
