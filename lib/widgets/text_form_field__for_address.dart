import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

class TextFormFieldForAddressWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool val;
  final bool readOnly;
  final int maxLine;
  final TextInputType keyType;
  final int? wordLimit;
  final Function(String) onChanged;
  final double? height;
  const TextFormFieldForAddressWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.val = true,
      required this.readOnly,
      required this.maxLine,
      required this.keyType,
      this.wordLimit,
      required this.onChanged,
      this.height})
      : super(key: key);
  @override
  State<TextFormFieldForAddressWidget> createState() =>
      _TextFormFieldForAddressWidgetState();
}

class _TextFormFieldForAddressWidgetState
    extends State<TextFormFieldForAddressWidget> {
  bool? val = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: CommonColor.greyColor,
        border: Border.all(
            width: 1,
            color: val!
                ? CommonColor.redColors
                : CommonColor.lightGreyForTextField),
        borderRadius: BorderRadius.circular(5),
      ),
      height: widget.height,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
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
        validator: widget.val
            ? (value) {
                if (value == null || value.isEmpty) {
                  setState(() {
                    val = true;
                  });
                  return;
                } else {
                  setState(() {
                    val = false;
                  });
                  return null;
                }
              }
            : null,
        onChanged: (value) {
          widget.onChanged(value);
        },
        style: const TextStyle(
            color: CommonColor.blackColor,
            fontFamily: AppStrings.poppins,
            fontWeight: FontWeight.w400,
            fontSize: 12),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          labelText: widget.hintText,
          labelStyle: const TextStyle(
              color: CommonColor.greyBottomNavContentColorInactive,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w400,
              fontSize: 12),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: CommonColor.greyBottomNavContentColorInactive,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
      ),
    );
  }
}
