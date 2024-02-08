import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class DetailReportAbsenPegawai extends StatelessWidget {
  const DetailReportAbsenPegawai({super.key});

  Widget dataPegawai() {
    return SizedBox(
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: grayColor,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adelya Agustina',
                style: openSansTextStyle.copyWith(
                  fontSize: 15,
                  color: blackColor,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Perawat Senior',
                style: openSansTextStyle.copyWith(
                  fontSize: 8,
                  fontWeight: regular,
                  color: grayColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dataAbsenMasuk() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Absen Masuk',
                style: openSansTextStyle.copyWith(
                  fontSize: 8,
                  fontWeight: regular,
                  color: grayColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Senin, 13 Feb 2023',
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '08.30',
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/image.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget dataAbsenKeluar() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Absen Keluar',
                style: openSansTextStyle.copyWith(
                  fontSize: 8,
                  fontWeight: regular,
                  color: grayColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Senin, 13 Feb 2023',
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '17.30',
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/image.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daily Detail',
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
            dataPegawai(),
            const SizedBox(height: 30),
            dataAbsenMasuk(),
            const SizedBox(height: 30),
            dataAbsenKeluar(),
          ],
        ),
      ),
    );
  }
}
