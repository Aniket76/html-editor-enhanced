import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/src/widgets/color_manager.dart';

class TextStyleManager {
  /// How to Use Text Style
  ///
  /// Case 1: No Changes
  /// style: TextStyleManager.inputFielsHint,
  ///
  /// Case 2: With Color Change
  /// style: TextStyleManager.inputFielsHint.copyWith(color: Colors.amber),
  ///

  //Input Fiels Text Style
  static TextStyle openSans = GoogleFonts.openSans(
    height: 1.5,
  );

  static TextStyle inputFielsLabel = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle inputFielsPlaceholder = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate400,
  );
  static TextStyle inputFielsHint = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate500,
  );

  //Body Text Style - Undefined
  static TextStyle bodyH1 = GoogleFonts.openSans(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle bodyHeader = GoogleFonts.openSans(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle bodyCaption = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle bodyDescription = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );

  static TextStyle bodySubHeading = GoogleFonts.openSans(
    fontSize: 23,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.slate600,
  );

  // Link Text Style - Undefined
  static TextStyle linkInactive = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle linkActive = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.slate600,
  );

  //CTA Text Style
  static TextStyle ctaLabel = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    // height: 1.5,
    color: ColorManager.pureWhite,
  );

  //Left Nav Text Style
  static TextStyle leftNavDeselected = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle leftNavSelected = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.blue700,
  );

  // Filter Text Style - Undefined
  static TextStyle filterHeading = GoogleFonts.openSans(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle filterSubheading = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle filterDropdown = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle filterSelected = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate600,
  );

  // Tabs Text Style
  static TextStyle tabsSelected = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.blue700,
  );
  static TextStyle tabsDeselected = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate500,
  );

  // Template Card Text Style - Undefined
  static TextStyle templateCardHeading = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle templateCardTags = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate400,
  );
  static TextStyle templateCardFormatTags = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle templateCardDescription = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );

  //Industries Card Text Style - Undefined
  static TextStyle industriesCardHeader = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle industriesCardDescription = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle industriesCardTag = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.orange600,
  );
  static TextStyle industriesCardTagNumber = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.orange600,
  );
  static TextStyle industriesCardLink = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.blue700,
  );

  // Modal Text Style - Undefined
  static TextStyle modalHeading = GoogleFonts.openSans(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle modalDescription = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate500,
  );
  static TextStyle modalUploadLabel = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.slate900,
  );

  // Table Text Style - Undefined
  static TextStyle tableHeading = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: ColorManager.slate900,
  );
  static TextStyle tableContent = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle tableLink = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.slate900,
  );

  // Progress Bar Text Style
  static TextStyle progressBarSelected = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.slate600,
  );
  static TextStyle progressBarDeselected = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorManager.slate600,
  );

  // Undefined Text Styles
  static TextStyle tabsCount = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.pureWhite,
  );

//chip label
  static TextStyle chipLabel = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: ColorManager.blue700,
  );

  //chip label
  static TextStyle mappableChip = GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorManager.pureWhite,
  );
}
