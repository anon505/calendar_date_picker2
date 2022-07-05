import 'dart:ui';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class BaseColors {
  //primary
  static Color primary500 = HexColor.fromHex('#3366FF');
  static Color primary600 = HexColor.fromHex('#254EDB');
  static Color primary900 = HexColor.fromHex('#091A7A');
  static Color primary50 = HexColor.fromHex('#F0F5FF');
  //neutral
  static Color neutral200 = HexColor.fromHex('#EDF2F7');
  static Color neutral300 = HexColor.fromHex('#E2E8F0');
  static Color neutral500 = HexColor.fromHex('#A0AEC0');
  static Color neutral600 = HexColor.fromHex('#718096');
  static Color neutral700 = HexColor.fromHex('#4A5568');
  static Color neutral800 = HexColor.fromHex('#2D3748');
  static Color neutral900 = HexColor.fromHex('#1A202C');
  //danger
  static Color danger500 = HexColor.fromHex('#EE2F28');
  //original color
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color yellow900 = HexColor.fromHex('#FFB600');
  //warning
  static Color warning500 = HexColor.fromHex('#FFB600');
  static Color warning400 = HexColor.fromHex('#FFCD3F');
  static Color warning600 = HexColor.fromHex('#DB9600');
  //info
  static Color info50 = HexColor.fromHex('#EAFEFF');
  //success
  static Color success600 = HexColor.fromHex('#5EB820');
  //facebook
  static Color facebook50 = HexColor.fromHex('#0078FF');
}

class BaseColorsConstant {
  //primary
  static const Color primary500 = Color(0xFF3366FF);
  static const Color primary600 = Color(0xFF254EDB);
  static const Color primary900 = Color(0xFF091A7A);
  static const Color primary50 = Color(0xFFF0F5FF);
  //neutral
  static const Color neutral200 = Color(0xFFEDF2F7);
  static const Color neutral300 = Color(0xFFE2E8F0);
  static const Color neutral500 = Color(0xFFA0AEC0);
  static const Color neutral600 = Color(0xFF718096);
  static const Color neutral700 = Color(0xFF4A5568);
  static const Color neutral800 = Color(0xFF2D3748);
  static const Color neutral900 = Color(0xFF1A202C);
  //danger
  static const Color danger500 = Color(0xFFEE2F28);
  //original color
  static const Color white = Color(0xFFFFFFFF);
  static const Color yellow900 = Color(0xFFFFB600);
  //warning
  static const Color warning500 = Color(0xFFFFB600);
  //info
  static const Color info50 = Color(0xFFEAFEFF);
  //success
  static const Color success600 = Color(0xFF5EB820);
  //facebook
  static const Color facebook50 = Color(0xFF0078FF);
}
