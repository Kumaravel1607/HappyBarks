import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

class SearchTextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final int maxLine;
  final TextInputType keyType;
  final int? wordLimit;
  final Function(String) onChanged;

  const SearchTextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.readOnly,
    required this.maxLine,
    required this.keyType,
    this.wordLimit,
    required this.onChanged,
  }) : super(key: key);
  @override
  State<SearchTextFormFieldWidget> createState() =>
      _SearchTextFormFieldWidgetState();
}

class _SearchTextFormFieldWidgetState extends State<SearchTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CommonColor.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 41,
      //color: CommonColor.whiteColor,
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        keyboardType: widget.keyType,
        maxLines: widget.maxLine,
        textCapitalization: TextCapitalization.sentences,
        inputFormatters: widget.wordLimit != null
            ? [
                new LengthLimitingTextInputFormatter(widget.wordLimit),
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
            contentPadding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: CommonColor.whiteColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: CommonColor.whiteColor, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: CommonColor.redColors, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: CommonColor.redColors, width: 1.0),
            ),
            fillColor: Colors.yellow,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                color: CommonColor.greyBottomNavContentColorInactive,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w400,
                fontSize: 12),
            suffixIcon: const Icon(Icons.search_rounded)),
      ),
    );


  }
}
