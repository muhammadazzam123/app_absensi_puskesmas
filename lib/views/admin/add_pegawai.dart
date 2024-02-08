import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class AddPegawai extends StatefulWidget {
  const AddPegawai({super.key});

  @override
  State<AddPegawai> createState() => _AddPegawaiState();
}

class _AddPegawaiState extends State<AddPegawai> {
  final _formState = GlobalKey<FormState>();
  TextEditingController namaTextController = TextEditingController();
  TextEditingController nipTextController = TextEditingController();
  TextEditingController alamatTextController = TextEditingController();
  TextEditingController jabatanTextController = TextEditingController();

  Widget namaForm() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [defaultShadow],
        border: Border.all(color: const Color(0xfff1f1f1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value == '') {
            return "nama tidak boleh kosong";
          }
          return null;
        },
        controller: namaTextController,
        cursorColor: grayColor,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'masukkan nama...',
          hintStyle: openSansTextStyle.copyWith(
              fontSize: 15, color: grayColor, fontWeight: regular),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget nipForm() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [defaultShadow],
        border: Border.all(color: const Color(0xfff1f1f1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value == '') {
            return "nip tidak boleh kosong";
          }
          return null;
        },
        controller: nipTextController,
        cursorColor: grayColor,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'masukkan NIP...',
          hintStyle: openSansTextStyle.copyWith(
              fontSize: 15, color: grayColor, fontWeight: regular),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget alamatForm() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [defaultShadow],
        border: Border.all(color: const Color(0xfff1f1f1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value == '') {
            return "alamat tidak boleh kosong";
          }
          return null;
        },
        controller: alamatTextController,
        cursorColor: grayColor,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'masukkan alamat...',
          hintStyle: openSansTextStyle.copyWith(
              fontSize: 15, color: grayColor, fontWeight: regular),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget jabatanForm() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [defaultShadow],
        border: Border.all(color: const Color(0xfff1f1f1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value == '') {
            return "jabatan tidak boleh kosong";
          }
          return null;
        },
        controller: jabatanTextController,
        cursorColor: grayColor,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'masukkan jabatan...',
          hintStyle: openSansTextStyle.copyWith(
              fontSize: 15, color: grayColor, fontWeight: regular),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget buttonMasuk() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [defaultShadow],
          border: Border.all(color: const Color(0xfff1f1f1), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child: Center(
          child: Text(
            'Tambah',
            style: openSansTextStyle.copyWith(
                fontSize: 15, fontWeight: regular, color: whiteColor),
          ),
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
          'Tambah Data Pegawai',
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
        child: Form(
          key: _formState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                namaForm(),
                const SizedBox(height: 20),
                nipForm(),
                const SizedBox(height: 20),
                alamatForm(),
                const SizedBox(height: 20),
                jabatanForm(),
                const SizedBox(height: 60),
                buttonMasuk(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
