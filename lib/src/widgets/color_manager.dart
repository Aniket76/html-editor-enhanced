import 'dart:math';

import 'package:flutter/material.dart';

class ColorManager {
  // Pure White
  static const Color pureWhite = Color(0xFFFFFFFF);

  //Blue Color Palette
  static const Color blue50 = Color(0xFFEDF2FE);
  static const Color blue100 = Color(0xFFDEE6FF);
  static const Color blue200 = Color(0xFFC0D0FF);
  static const Color blue300 = Color(0xFF99B0FF);
  static const Color blue400 = Color(0xFF7184FF);
  static const Color blue500 = Color(0xFF505BFF);
  static const Color blue600 = Color(0xFF2420FA);
  static const Color blue700 = Color(0xFF2B24DE);
  static const Color blue800 = Color(0xFF2321B2);
  static const Color blue900 = Color(0xFF23238C);
  // static const Color blue950 = Color(0xFF0F172A);

  //Slate Color Palette
  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);

  //Pink Color Palette
  static const Color pink50 = Color(0xFFFFF4FD);
  static const Color pink100 = Color(0xFFFFE7FC);
  static const Color pink600 = Color(0xFFDE23B5);

  //Orange Color Palette
  static const Color orange50 = Color(0xFFFEF4F2);
  static const Color orange100 = Color(0xFFFEE7E2);
  static const Color orange600 = Color(0xFFDE4623);

  //Red Alert Color Palette
  static const Color redAlert50 = Color(0xFFFEF2F3);
  static const Color redAlert200 = Color(0xFFFFC9CC);

  static const Color redAlert600 = Color(0xFFDA1E28);
  static const Color redAlert800 = Color(0xFF9C181F);

  //Green Alert Color Palette
  static const Color greenAlert50 = Color(0xFFF0FDF3);
  static const Color greenAlert200 = Color(0xFFBDF5CD);
  static const Color greenAlert600 = Color(0xFF198038);
  static const Color greenAlert800 = Color(0xFF165129);
  static const Color greenAlert700 = Color(0xFF198038);

  //Amber Alert Color Palette
  static const Color amberAlert50 = Color(0xFFFFF6ED);
  static const Color amberAlert200 = Color(0xFFFFD4A8);
  static const Color amberAlert600 = Color(0xFFFF832B);
  static const Color amberAlert400 = Color(0xFFFF832B);
  static const Color amberAlert800 = Color(0xFFEF4F07);

  //Drop shadow colors
  static Color shadowColorWithoutOpacity = const Color(0xff0f172a);
  static Color defineTemplateBoxShadowColorWithoutOpacity = const Color(0xff0F172A14);
  static Color dropShadow8 = const Color(0xFF0F172A).withOpacity(0.08);
  static Color dropShadow10 = const Color(0xFF00001A).withOpacity(0.1);

  static Color inputShadowColor = const Color(0xff0f172a).withOpacity(0.04);

  List<int> solidColors = [
    0xFF34495E, // Dark Blue
    0xFF2ECC71, // Dark Green
    0xFFE74C3C, // Dark Red
    0xFF9B59B6, // Dark Purple
    0xFF1ABC9C, // Dark Teal
    0xFFE67E22, // Dark Orange
  ];

// Function to get a random solid color
  Color getRandomColor() {
    Random random = Random();
    int index = random.nextInt(solidColors.length);
    return Color(solidColors[index]);
  }

  // Undefined Colors
  static Color shadowColor = const Color(0xff0f172a0f).withOpacity(0.06);
  static Color emptyCardBGColor = const Color(0xFFF8FAFC);
  static Color emptyCardBorderColor = const Color(0xFFE2E8F0);
}
