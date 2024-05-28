import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/src/widgets/color_manager.dart';
import 'package:html_editor_enhanced/src/widgets/text_style_manager.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isActive;
  final bool isLoading;
  final bool isSolid;
  final bool isAlert;
  final bool isLarge;
  final bool isPublish;
  final double? width;
  final String disabledHintMessage;
  final Alignment disabledHintAlignment;

  const CustomButton({
    super.key,
    this.label = "Custom Button",
    required this.onPressed,
    this.isActive = true,
    this.isLoading = false,
    this.isSolid = true,
    this.isAlert = false,
    this.isLarge = false,
    this.width,
    this.isPublish = false,
    this.disabledHintMessage = "Button is disabled",
    this.disabledHintAlignment = Alignment.centerRight,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: (!widget.isActive || widget.isLoading)
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: (!widget.isLoading && widget.isActive) ? widget.onPressed : null,
        child: buttonContainer(),
      ),
    );
  }

  Widget buttonContainer() {

    Color backgroundColor = getBackgroundColor(
        widget.isSolid,
        widget.isActive,
        widget.isAlert,
        widget.isPublish
    );
    Color borderColor = getBorderColor(
        widget.isActive,
        widget.isAlert,
        widget.isPublish
    );
    Color textColor = getTextColor(
        widget.isSolid,
        widget.isActive,
        widget.isPublish
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      height: widget.isLarge ? 48 : 40,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 18.5),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: getButtonChild(textColor),
    );
  }

  Widget getButtonChild(Color textColor) {
    if (widget.isLoading && widget.isActive) {
      return Center(
        child: SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.isSolid ? ColorManager.pureWhite : ColorManager.blue700,
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          style: TextStyleManager.ctaLabel.copyWith(
            color: textColor,
            // fontSize: isHovered && widget.isActive && !widget.isLoading ? 17 : 16,
          ),
          child: Text(
            widget.label,
          ),
        ),
      );
    }
  }

  Color getBackgroundColor(bool isSolid, bool isActive, bool isAlert, bool isPublished) {
    if (isAlert && isActive) {
      return ColorManager.redAlert600;
    } else if (isPublished) {
      return isActive ? ColorManager.greenAlert700 : ColorManager.slate200;
    } else if (!isActive) {
      return isSolid ? ColorManager.slate200 : Colors.transparent;
    } else {
      return isSolid ? ColorManager.blue700 : Colors.transparent;
    }
  }

  Color getBorderColor(bool isActive, bool isAlert, bool isPublished) {
    if (isAlert && isActive) {
      return ColorManager.redAlert600;
    } else if (isPublished && isActive) {
      return ColorManager.greenAlert700;
    } else {
      return isActive ? ColorManager.blue700 : ColorManager.slate200;
    }
  }

  Color getTextColor(bool isSolid, bool isActive, bool isPublished) {
    if (isPublished && isActive) {
      return ColorManager.pureWhite;
    } else if (isSolid) {
      return isActive ? ColorManager.pureWhite : ColorManager.slate500;
    } else {
      return isActive ? ColorManager.blue700 : ColorManager.slate500;
    }
  }
}
