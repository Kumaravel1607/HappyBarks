// ignore_for_file: prefer_const_constructors, unnecessary_new, curly_braces_in_flow_control_structures, unnecessary_string_escapes

import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final Color color;
  final int? maxLine;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? underline;
  final TextAlign? textAlign;

  const TextWidget(
      {Key? key,
      required this.text,
      required this.color,
      this.maxLine,
      required this.fontFamily,
      required this.fontWeight,
      required this.fontSize,
      this.underline = TextDecoration.none,
      this.textAlign = TextAlign.start})
      : super(key: key);
  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxLine ?? null,
      textAlign: widget.textAlign,
      style: TextStyle(
          decoration: widget.underline!,
          overflow: widget.maxLine == null
              ? TextOverflow.visible
              : TextOverflow.ellipsis,
          color: widget.color,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize),
    );
  }
}
