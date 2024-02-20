import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';

class TextFormFieldLoginWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? validator;
  final bool readOnly;
  final int maxLine;
  final TextInputType keyType;
  final int? wordLimit;
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final Function()? onSuffixTap;
  final double? height;
  const TextFormFieldLoginWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.validator,
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
  State<TextFormFieldLoginWidget> createState() =>
      _TextFormFieldLoginWidgetState();
}

class _TextFormFieldLoginWidgetState extends State<TextFormFieldLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: false,
      cursorColor: CommonColor.greyAppBarTextColor,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validator;
        }
        return null;
      },
      onChanged: (value) {
        widget.onChanged(value);
      },
      style: const TextStyle(
          color: CommonColor.greyAppBarTextColor,
          fontFamily: AppStrings.poppins,
          fontWeight: FontWeight.w400,
          fontSize: 12),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              left: 0,
              right: 0,
              top: widget.suffixIcon == null ? 0 : 16,
              bottom: 0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: CommonColor.greyBottomNavContentColorInactive),
          ),
          // contentPadding: widget.height! > 45
          //     ? const EdgeInsets.only(top: 25, bottom: 25, right: 16, left: 16)
          //     : const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide: const BorderSide(
          //       color: CommonColor.grayHomeGridViewBg, width: 1.0),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide: const BorderSide(
          //       color: CommonColor.grayHomeGridViewBg, width: 1.0),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide:
          //       const BorderSide(color: CommonColor.redColors, width: 1.0),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide:
          //       const BorderSide(color: CommonColor.redColors, width: 1.0),
          // ),

          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: CommonColor.greyAppBarTextColor,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w400,
              fontSize: 12),
          suffixIcon: widget.suffixIcon == null ? null : widget.suffixIcon
          // : GestureDetector(
          //     onTap: () {
          //       widget.onSuffixTap!();
          //     },
          //     child: widget.suffixIcon),
          ),
    );
  }
}
