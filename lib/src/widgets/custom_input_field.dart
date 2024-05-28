import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html_editor_enhanced/src/widgets/color_manager.dart';
import 'package:html_editor_enhanced/src/widgets/text_style_manager.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.label = 'Label',
    this.hintText = 'Placeholder',
    this.maxLength,
    this.enabled = true,
    this.multipleLines = false,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.required = false,
    this.errorText,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormattersType = InputFormattersType.alphaNumeric,
    this.validator,
    this.autoValidateMode,
    this.initialValue,
    this.onFocusChange,
  });

  final String? initialValue;
  final String label;
  final String hintText;
  final int? maxLength;
  final bool multipleLines;
  final bool enabled;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool required;
  final String? errorText;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final InputFormattersType inputFormattersType;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final ValueChanged<bool>? onFocusChange;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isError = (widget.errorText ?? "").isNotEmpty;
    return SizedBox(
      // width: 442,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.label.isNotEmpty,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.label,
                      style: TextStyleManager.inputFielsLabel,
                    ),
                    Visibility(
                      visible: widget.required,
                      child: Text(
                        '*',
                        style: getInputFieldLabelTextStyle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4,),
              ],
            ),
          ),
          SizedBox(
            height: widget.multipleLines ? 135 : null,
            child: Focus(
              onFocusChange: widget.onFocusChange,
              child: TextFormField(
                initialValue: widget.initialValue,
                controller: widget.controller,
                autovalidateMode: widget.autoValidateMode,
                validator: widget.validator,
                keyboardType: widget.keyboardType ?? TextInputType.multiline,
                maxLines: widget.multipleLines ? null : 1,
                expands: widget.multipleLines ? true : false,
                textAlignVertical: getTextAlignVertical(
                  widget.multipleLines,
                ),
                textCapitalization: widget.textCapitalization,
                cursorHeight: 16,
                onChanged: (val) {
                  widget.onChanged?.call(val);
                },
                focusNode: widget.focusNode,
                minLines: null,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    getRegExp(widget.inputFormattersType),
                  ),
                ],
                cursorColor: ColorManager.slate900,
                maxLength: widget.maxLength,
                enabled: widget.enabled,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.enabled ? Colors.white : ColorManager.slate100,
                  counter: widget.maxLength == null? null: counter(isError),
                  hintText: widget.hintText,
                  hintStyle: getInputFieldHintTextStyle(),
                  errorText: (widget.errorText ?? "").isEmpty ? null : widget.errorText,
                  errorMaxLines: 1,
                  errorStyle: TextStyleManager.inputFielsHint.copyWith(color: ColorManager.redAlert600, height: 0.3),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorManager.slate200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: (widget.controller?.text ?? "").isNotEmpty ? ColorManager.slate400 : ColorManager.slate200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorManager.blue700),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorManager.redAlert600),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ColorManager.redAlert600),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: (widget.controller?.text ?? "").isNotEmpty ? ColorManager.slate400 : ColorManager.slate200),
                  ),
                  contentPadding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                  ),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 16),
                  ),
                  suffix: const Padding(
                    padding: EdgeInsets.only(right: 16),
                  ),
                ),
                style: TextStyleManager.inputFielsPlaceholder.copyWith(
                  color: ColorManager.slate900,
                ),
              ),
            ),
          ),
          // addVerticalSpace(4),
          //  error(isError),
        ],
      ),
    );
  }

  Widget error(bool isError) {
    return Visibility(
      visible: isError,
      child: SizedBox(
        width: 400,
        child: Text(
          widget.errorText ?? '',
          style: TextStyleManager.inputFielsHint.copyWith(
            color: ColorManager.redAlert600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget counter(bool isError) {
    return Visibility(
      visible: widget.maxLength != null,
      child: Text(
        '${widget.controller?.text.length}/${widget.maxLength}',
        style: getInputFieldHintTextStyleForError(isError).copyWith(height: 0.3),
      ),
    );
  }

  TextAlignVertical getTextAlignVertical(bool multipleLines) {
    if (multipleLines) {
      return TextAlignVertical.top;
    } else {
      return TextAlignVertical.center;
    }
  }

  TextStyle getInputFieldLabelTextStyle() {
    return TextStyleManager.inputFielsLabel.copyWith(
      color: ColorManager.redAlert600,
    );
  }

  TextStyle getInputFieldHintTextStyle() {
    return TextStyleManager.inputFielsPlaceholder.copyWith(
      color: ColorManager.slate400,
    );
  }

  Color getUnfocusedBorderColor() {
    if ((widget.controller?.text ?? "").isNotEmpty) {
      return ColorManager.slate400;
    } else {
      return ColorManager.slate200;
    }
  }

  TextStyle getInputFieldHintTextStyleForError(bool isError) {
    if (isError) {
      return TextStyleManager.inputFielsHint.copyWith(
        color: ColorManager.redAlert600,
      );
    } else {
      return TextStyleManager.inputFielsHint.copyWith(
        color: ColorManager.slate500,
      );
    }
  }

  Pattern getRegExp(InputFormattersType type) {
    switch (type) {
      case InputFormattersType.numbers:
        return RegExp("[0-9]");
      case InputFormattersType.alphabets:
        return RegExp("[a-zA-Z ]");
      case InputFormattersType.alphaNumeric:
        return RegExp("[A-Za-z0-9_ ]");
      case InputFormattersType.paragraph:
        return RegExp("[A-Za-z0-9_.,!?\\-+*:/;'\"\\s]");
      case InputFormattersType.tableAndColumnNames:
        return RegExp("[A-Za-z0-9_]");
      case InputFormattersType.everything:
        return RegExp(".");
    }

    //mix RegExp(
    //             r'[a-zA-Z0-9\s!{}"()-_?@#.,;+=*&^%$!/|]+',
    //           )
  }
}

enum InputFormattersType { numbers, alphabets, alphaNumeric, tableAndColumnNames, everything, paragraph }
