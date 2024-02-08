import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff42C1B6);
Color blackColor = const Color(0xff333333);
Color grayColor = const Color.fromARGB(94, 128, 128, 128);
Color grayColorDua = const Color(0xff808080);
Color whiteColor = const Color(0xffFAFAFA);
Color redColor = const Color.fromARGB(159, 196, 49, 33);
Color greenColor = const Color.fromARGB(159, 65, 148, 59);

TextStyle openSansTextStyle = GoogleFonts.openSans();

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

final defaultShadow = BoxShadow(
  offset: const Offset(0, 0),
  blurRadius: 15,
  color: const Color(0xffeeeeee).withOpacity(0.0),
);
