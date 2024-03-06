import 'package:app_absensi_puskesmas/models/user_model.dart';
import 'package:app_absensi_puskesmas/services/auth_service.dart';
import 'package:app_absensi_puskesmas/services/user_service.dart';
import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> user;

  @override
  void initState() {
    user = UserService().getUserById();
    super.initState();
  }

  void _logout() async {
    try {
      SharedPreferences refs = await SharedPreferences.getInstance();
      refs.remove('token');
      refs.remove('userId');
      refs.remove('userLevel');
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    } catch (e) {
      debugPrint('Gagal Logout $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: FutureBuilder<User?>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const Text('Loading ...'));
          } else if (snapshot.hasData) {
            return Column(
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
                  '${snapshot.data!.nama}',
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
                          ': ${snapshot.data!.nama}',
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
                          ': ${snapshot.data!.nip}',
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
                          ': ${snapshot.data!.jabatan}',
                          style: openSansTextStyle.copyWith(
                              fontSize: 14,
                              color: grayColorDua,
                              fontWeight: regular),
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
                        onPressed: () {
                          _logout();
                        },
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
            );
          } else {
            return const Text('Terjadi Kesalahan');
          }
        },
      ),
    ));
  }
}
