import 'package:app_absensi_puskesmas/services/auth_service.dart';
import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formState = GlobalKey<FormState>();
  bool passToggle = true;
  bool _isLoading = false;
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  void _validateForm() {
    if (_formState.currentState!.validate()) {
      _login();
    }
  }

  void showSnackBar(text) {
    SnackBar snackBar = SnackBar(
      content: Text(text.toString()),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _login() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final Map<String, dynamic> data = {
        "username": usernameTextController.text,
        "password": passwordTextController.text
      };
      print("test");
      final response = await AuthService().authLogin(data);
      print(response);

      if (response['success']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('appToken', response['token']);
        await prefs.setInt('userId', response['user']['id']);
        int level = response['user']['level'];
        await prefs.setInt('userLevel', level);

        if (context.mounted) {
          if (level == 2) {
            Navigator.pushReplacementNamed(context, '/bottom-navbar');
          } else {
            showSnackBar('Kamu tidak punya akses');
          }
        }
      } else {
        showSnackBar(response['message']);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      showSnackBar('Error :$e');
      print(e);
    }
  }

  Widget usernameForm() {
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
            return "username tidak boleh kosong";
          }
          return null;
        },
        controller: usernameTextController,
        cursorColor: grayColor,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'username',
          hintStyle: openSansTextStyle.copyWith(
              fontSize: 15, color: grayColor, fontWeight: regular),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [defaultShadow],
        border: Border.all(color: const Color(0xfff1f1f1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: TextFormField(
        obscureText: passToggle,
        validator: (value) {
          if (value!.isEmpty) {
            return "password tidak boleh kosong";
          } else if (passwordTextController.text.length < 6) {
            return "password kurang dari 6 karakter";
          }
          return null;
        },
        controller: passwordTextController,
        cursorColor: grayColor,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                passToggle = !passToggle;
              });
            },
            child: Icon(
              passToggle ? Icons.visibility_off : Icons.visibility,
              color: passToggle ? grayColor : primaryColor,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'password',
          hintStyle: openSansTextStyle.copyWith(
              fontSize: 15, color: grayColor, fontWeight: regular),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget buttonMasuk() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _validateForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: !_isLoading
            ? Text(
                'Masuk',
                style: openSansTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                  color: whiteColor,
                ),
              )
            : CircularProgressIndicator(
                color: whiteColor,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                usernameForm(),
                const SizedBox(height: 20),
                passwordForm(),
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
