import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class ReportAbsenPegawai extends StatelessWidget {
  const ReportAbsenPegawai({super.key});

  Widget listAbsen(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/absen-pegawai-detail');
      },
      child: SizedBox(
        child: Column(
          children: [
            Divider(
              color: grayColor,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Report Absensi Pegawai',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.calendar_month_sharp,
                    size: 16,
                    color: blackColor,
                  ),
                ),
                Text(
                  '12/06/2024',
                  style: openSansTextStyle.copyWith(
                    fontSize: 12,
                    color: blackColor,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            listAbsen(context),
          ],
        ),
      ),
    );
  }
}
