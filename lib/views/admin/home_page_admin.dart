import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class HomePageAdmin extends StatelessWidget {
  const HomePageAdmin({super.key});

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
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/detail-pegawai-admin');
                },
                icon: Icon(
                  Icons.space_dashboard_outlined,
                  size: 25,
                  color: grayColorDua,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-pegawai');
                },
                icon: Iconify(
                  MaterialSymbols.edit_document_outline_rounded,
                  size: 25,
                  color: grayColorDua,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Iconify(
                  MaterialSymbols.delete_outline_rounded,
                  size: 25,
                  color: grayColorDua,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Admin!',
                        style: openSansTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: blackColor),
                      ),
                      Text(
                        'Semoga hari ini bisa lebih baik dari kemarin',
                        style: openSansTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                            color: grayColor),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.logout_outlined,
                        size: 25,
                        color: blackColor,
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Data Pegawai',
                style: openSansTextStyle.copyWith(
                    fontSize: 15, fontWeight: semiBold, color: blackColor),
              ),
              const SizedBox(height: 25),
              listAbsen(context),
              listAbsen(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: SizedBox(
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/add-pegawai');
            },
            label: Text(
              'Tambah Data Pegawai',
              style: openSansTextStyle.copyWith(
                fontSize: 15,
                fontWeight: regular,
                color: whiteColor,
              ),
            ),
            icon: Icon(Icons.person, color: whiteColor),
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
