import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final int maxLine;
  final TextInputType keyType;
  final int? wordLimit;
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final Function()? onSuffixTap;
  final double? height;
  const TextFormFieldWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.readOnly,
      required this.maxLine,
      required this.keyType,
      this.wordLimit,
      required this.onChanged,
      this.suffixIcon,
      this.onSuffixTap,
      this.height})
      : super(key: key);
  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: false,
      cursorColor: CommonColor.blackColor,
      controller: widget.controller,
      readOnly: widget.readOnly,
      keyboardType: widget.keyType,
      maxLines: widget.maxLine,
      textCapitalization: TextCapitalization.sentences,
      inputFormatters: widget.wordLimit != null
          ? [
              LengthLimitingTextInputFormatter(widget.wordLimit),
            ]
          : null,
      // validator: (value) {
      //   va
      // },
      onChanged: (value) {
        widget.onChanged(value);
      },
      style: const TextStyle(
          color: CommonColor.blackColor,
          fontFamily: AppStrings.poppins,
          fontWeight: FontWeight.w400,
          fontSize: 12),
      decoration: InputDecoration(
        filled: true,
        fillColor: CommonColor.grayHomeGridViewBg,
        // contentPadding:
        //     const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        contentPadding: widget.height! > 45
            ? const EdgeInsets.only(top: 25, bottom: 25, right: 16, left: 16)
            : const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
              color: CommonColor.grayHomeGridViewBg, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
              color: CommonColor.grayHomeGridViewBg, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
              const BorderSide(color: CommonColor.redColors, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
              const BorderSide(color: CommonColor.redColors, width: 1.0),
        ),

        hintText: widget.hintText,
        hintStyle: const TextStyle(
            color: CommonColor.greyBottomNavContentColorInactive,
            fontFamily: AppStrings.poppins,
            fontWeight: FontWeight.w400,
            fontSize: 12),
        suffix: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: () {
                  widget.onSuffixTap!();
                },
                child: widget.suffixIcon),
      ),
    );
  }
}
