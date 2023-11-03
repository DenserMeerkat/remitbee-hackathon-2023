// Flutter imports:
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 14, 168, 104);
const kLPrimaryColor = Color.fromARGB(255, 17, 206, 127);
const kStudentColor = Color.fromARGB(255, 104, 206, 201);
const kLStudentColor = Color.fromARGB(255, 87, 237, 229);
const kAuthorityColor = Color.fromARGB(255, 181, 83, 72);
const kLAuthorityColor = Color.fromARGB(255, 255, 128, 114);
const kAdminColor = Color.fromARGB(255, 201, 185, 107);
const kLAdminColor = Color.fromARGB(255, 255, 235, 138);
const kTextColor = Color.fromARGB(255, 240, 240, 240);
const kLTextColor = Color.fromARGB(255, 25, 25, 25);
const kBackgroundColor = Color.fromARGB(255, 18, 18, 18);
const kLBackgroundColor = Color.fromARGB(255, 230, 230, 230);
const kBlack10 = Color.fromARGB(255, 10, 10, 10);
const kLBlack10 = Color.fromARGB(255, 240, 240, 240);
const kBlack15 = Color.fromARGB(255, 15, 15, 15);
const kLBlack15 = Color.fromARGB(255, 220, 220, 220);
const kBlack20 = Color.fromARGB(255, 20, 20, 20);
const kLBlack20 = Color.fromARGB(255, 210, 210, 210);
const kGrey30 = Color.fromARGB(255, 30, 30, 30);
const kLGrey30 = Color.fromARGB(255, 190, 190, 190);
const kGrey40 = Color.fromARGB(255, 40, 40, 40);
const kLGrey40 = Color.fromARGB(255, 170, 170, 170);
const kGrey50 = Color.fromARGB(255, 50, 50, 50);
const kLGrey50 = Color.fromARGB(255, 150, 150, 150);
const kGrey70 = Color.fromARGB(255, 70, 70, 70);
const kLGrey70 = Color.fromARGB(255, 120, 120, 120);
const kGrey90 = Color.fromARGB(255, 90, 90, 90);
const kLGrey90 = Color.fromARGB(255, 70, 70, 70);
const kGrey150 = Color.fromARGB(255, 150, 150, 150);
const kLGrey150 = Color.fromARGB(255, 30, 30, 30);
const kSecButtonColor = Color.fromARGB(255, 255, 189, 128);

const kErrorColor = Color.fromARGB(255, 201, 69, 69);
const kValidColor = Color.fromARGB(255, 99, 182, 74);
const kWarnColor = Color.fromARGB(255, 241, 217, 95);
const double kDefaultPadding = 20.0;
const double kHeaderHeight = 120.0;
const String appName = "Hitch Handler";

Color splash(bool isDark) {
  return isDark ? kTextColor.withOpacity(0.1) : kLTextColor.withOpacity(0.1);
}

const String convertURL = "http://api.exchangeratesapi.io/";
