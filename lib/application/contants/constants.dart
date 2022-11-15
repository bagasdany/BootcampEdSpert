import 'package:flutter/material.dart';

class Constants {
  static const MaterialColor primaryColor =
      MaterialColor(0xffe92030, <int, Color>{
    50: Color(0xfffde9ea),
    100: Color(0xfffbd2d6),
    200: Color(0xfff6a6ac),
    300: Color(0xfff27983),
    400: Color(0xffed4d59),
    500: Color(0xffe92030),
    600: Color(0xffd21d2b),
    700: Color(0xffba1a26),
    800: Color(0xffa31622),
    900: Color(0xff8c131d)
  });

  static const MaterialColor gray = MaterialColor(0xff6b7280, <int, Color>{
    50: Color(0xfff9fafb),
    100: Color(0xfff3f4f6),
    200: Color(0xffe5e7eb),
    300: Color(0xffd1d5db),
    400: Color(0xff9ca3af),
    500: Color(0xff6b7280),
    600: Color(0xff4b5563),
    700: Color(0xff374151),
    800: Color(0xff1f2937),
    900: Color(0xff111827)
  });

  static const MaterialColor red = MaterialColor(0xffEF4444, <int, Color>{
    50: Color(0xffFEF2F2),
    100: Color(0xffFEE2E2),
    200: Color(0xffFECACA),
    300: Color(0xffFEA5A5),
    400: Color(0xffF87171),
    500: Color(0xffEF4444),
    600: Color(0xffDC2626),
    700: Color(0xffB91C1C),
    800: Color(0xff991B1B),
    900: Color(0xff7F1D1D),
  });

  static const MaterialColor pink = MaterialColor(0xffffc0cb, <int, Color>{
    50: Color(0xfff9fafb),
    100: Color(0xfff3f4f6),
    200: Color(0xffe5e7eb),
    300: Color(0xffd1d5db),
    800: Color(0xffffdae9),
    900: Color(0xfffddde6)
  });

  static const MaterialColor yellow = MaterialColor(0xffeab308, <int, Color>{
    50: Color(0xfffefce8),
    100: Color(0xfffef9c3),
    200: Color(0xfffef08a),
    300: Color(0xfffde047),
    400: Color(0xfffacc15),
    500: Color(0xffeab308),
    600: Color(0xffca8a04),
    700: Color(0xff854d0e),
    800: Color(0xff854d0e),
    900: Color(0xff713f12),
  });

  static const MaterialColor lime = MaterialColor(0xff65a30d, <int, Color>{
    50: Color(0xfff7fee7),
    100: Color(0xffecfccb),
    200: Color(0xffd9f99d),
    300: Color(0xffbef264),
    400: Color(0xffa2e635),
    500: Color(0xff84cc16),
    600: Color(0xff64a30d),
    700: Color(0xff4d7c0f),
    800: Color(0xff3f6212),
    900: Color(0xff365314)
  });

  static const MaterialColor sky = MaterialColor(0xff0284c7, <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xff0284c7),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  });
  static const MaterialColor orange = MaterialColor(0xffea580c, <int, Color>{});
  static const MaterialColor amber = MaterialColor(0xffd97706, <int, Color>{});
  static const MaterialColor base = MaterialColor(0xfff5f5f4, <int, Color>{});
  static const MaterialColor black = MaterialColor(0xff000000, <int, Color>{});
  static const MaterialColor white = MaterialColor(0xffffffff, <int, Color>{});

  static const double spacing1 = 4;
  static const double spacing2 = 8;
  static const double spacing3 = 11;
  static const double spacing4 = 16;
  static const double spacing5 = 24;
  static const double spacing6 = 28;
  static const double spacing7 = 32;
  static const double spacing8 = 36;
  static const double spacing9 = 40;
  static const double spacing10 = 50;
  static const double spacing11 = 60;

  static const double fontSize11Xl = 110;
  static const double fontSize10Xl = 86;
  static const double fontSize9Xl = 80;
  static const double fontSize8Xl = 72;
  static const double fontSize7Xl = 66;
  static const double fontSize6Xl = 60;
  static const double fontSize5Xl = 54;
  static const double fontSize4Xl = 40;
  static const double fontSize3Xl = 36;
  static const double fontSize2Xl = 24;
  static const double fontSizeXl = 21;
  static const double fontSizeLg = 18;
  static const double fontSizeMd = 15;
  static const double fontSizeSm = 13;
  static const double fontSizeXs = 11;
  static const double fontSizeXx = 8;

  static const String primaryFont = 'FiraSans Regular';
  static const String primaryFontBold = 'FiraSans Bold';
  static const String primaryFontLight = 'FiraSans Light';

  static const TextStyle heading1 = TextStyle(
      fontSize: Constants.fontSize3Xl, fontFamily: Constants.primaryFontBold);
  static const TextStyle heading2 = TextStyle(
      fontSize: Constants.fontSize2Xl, fontFamily: Constants.primaryFontBold);
  static const TextStyle heading3 = TextStyle(
      fontSize: Constants.fontSizeXl, fontFamily: Constants.primaryFontBold);
  static const TextStyle heading4 = TextStyle(
      fontSize: Constants.fontSizeLg, fontFamily: Constants.primaryFontBold);
  static const TextStyle heading5 = TextStyle(
      fontSize: Constants.fontSizeMd, fontFamily: Constants.primaryFontBold);
  static const TextStyle textXl = TextStyle(fontSize: Constants.fontSizeXl);
  static const TextStyle textLg = TextStyle(fontSize: Constants.fontSizeLg);
  static const TextStyle textMd = TextStyle(fontSize: Constants.fontSizeMd);
  static const TextStyle textSm = TextStyle(fontSize: Constants.fontSizeSm);
  static const TextStyle textXs = TextStyle(fontSize: Constants.fontSizeXs);
}
