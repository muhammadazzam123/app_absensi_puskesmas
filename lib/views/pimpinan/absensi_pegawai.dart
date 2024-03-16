import 'package:app_absensi_puskesmas/models/absensi_model.dart';
import 'package:app_absensi_puskesmas/services/absensi_service.dart';
import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ReportAbsenPegawai extends StatefulWidget {
  const ReportAbsenPegawai({super.key});

  @override
  State<ReportAbsenPegawai> createState() => _ReportAbsenPegawaiState();
}

class _ReportAbsenPegawaiState extends State<ReportAbsenPegawai> {
  late Future<List<RiwayatAbsensi>> _riwayatAbsensiData;
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
    dateFormat = DateFormat.yMd('id');
    timeFormat = DateFormat.Hm('id');
    _riwayatAbsensiData = AbsensiService().getAllAbsensi();
  }

  Widget listAbsen(BuildContext context, RiwayatAbsensi riwayatAbsensi) {
    // final tanggalHadir = dateFormat
    //     .format(DateTime.parse(snapshot.data![index].createdAt.toString()));
    final waktuHadir = timeFormat
        .format(DateTime.parse(riwayatAbsensi.createdAt.toString()).toLocal());
    final waktuPulang = timeFormat
        .format(DateTime.parse(riwayatAbsensi.updatedAt.toString()).toLocal());
    // final rentangWaktu =
    //     DateTime.parse(snapshot.data![index].updatedAt.toString()).difference(
    //         DateTime.parse(snapshot.data![index].createdAt.toString()));
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
                      '${riwayatAbsensi.user!.nama}',
                      style: openSansTextStyle.copyWith(
                        fontSize: 15,
                        color: blackColor,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${riwayatAbsensi.user!.jabatan}',
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
                  waktuHadir,
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
                  waktuPulang,
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
                // Text(
                //   '12/06/2024',
                //   style: openSansTextStyle.copyWith(
                //     fontSize: 12,
                //     color: blackColor,
                //     fontWeight: semiBold,
                //   ),
                // )
              ],
            ),
            FutureBuilder(
                future: _riwayatAbsensiData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return listAbsen(context, snapshot.data![index]);
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height / 2,
                    alignment: Alignment.center,
                    child: const Center(child: Text('Loading...')),
                  );
                })
          ],
        ),
      ),
    );
  }
}
