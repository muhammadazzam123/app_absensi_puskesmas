import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class DataPegawai extends StatelessWidget {
  const DataPegawai({super.key});

  Widget listAbsen(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Divider(
            color: grayColor,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: grayColor,
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(width: 25),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/data-detail-pegawai');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.space_dashboard_outlined,
                      size: 16,
                      color: blackColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Detail',
                      style: openSansTextStyle.copyWith(
                          fontSize: 12, fontWeight: regular, color: blackColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
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
            listAbsen(context),
          ],
        ),
      ),
    );
  }
}
