import 'package:app_absensi_puskesmas/models/user_model.dart';
import 'package:app_absensi_puskesmas/services/user_service.dart';
import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = UserService().getAllUser();
  }

  Widget listAbsen(BuildContext context, username, jabatan) {
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
                  SizedBox(
                    width: 100,
                    child: Text(
                      '$username',
                      style: openSansTextStyle.copyWith(
                        fontSize: 15,
                        color: blackColor,
                        fontWeight: regular,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$jabatan',
                    style: openSansTextStyle.copyWith(
                      fontSize: 8,
                      fontWeight: regular,
                      color: grayColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomDialogWidget(),
                  );
                },
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
    return SafeArea(
      child: Scaffold(
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
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: FutureBuilder(
                      future: users,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return listAbsen(
                                    context,
                                    snapshot.data![index].nama,
                                    snapshot.data![index].jabatan);
                              });
                        } else {
                          return const Text('Loading ...');
                        }
                      }),
                ),
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
      ),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hapus Data Pegawai',
              style: openSansTextStyle.copyWith(
                  fontSize: 18, fontWeight: regular, color: blackColor),
            ),
            SizedBox(height: 10),
            Text(
              'Apakah Kamu Yakin Ingin Menghapus Data Ini',
              style: openSansTextStyle.copyWith(
                  fontSize: 9, fontWeight: regular, color: grayColorDua),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffC43121))),
                  child: Text(
                    'Hapus',
                    style: openSansTextStyle.copyWith(
                        fontSize: 10, fontWeight: regular, color: whiteColor),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: openSansTextStyle.copyWith(
                          fontSize: 10, fontWeight: regular, color: blackColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
