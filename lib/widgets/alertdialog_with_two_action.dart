import 'package:flutter/material.dart';

class AlertDialogWithTwoAction extends StatefulWidget {
  const AlertDialogWithTwoAction(
      {required this.context,
      required this.title,
      required this.content,
      required this.okText,
      required this.cancelText,
      required this.okOnPressed,
      required this.cancelOnPressed,
      Key? key})
      : super(key: key);

  final BuildContext context;
  final String title;
  final String content;
  final String okText;
  final String cancelText;
  final Function okOnPressed;
  final Function cancelOnPressed;

  @override
  State<AlertDialogWithTwoAction> createState() =>
      _AlertDialogWithTwoActionState();
}

class _AlertDialogWithTwoActionState extends State<AlertDialogWithTwoAction> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _getContent() {
    List<Widget> _temp = [];
    if (widget.content != '') {
      _temp.add(Text(widget.content));
      _temp.add(const SizedBox(
        height: 8.0,
      ));
    }
    return _temp;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _getContent(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.cancelOnPressed();
          },
          child: Text(widget.cancelText),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.okOnPressed();
          },
          child: Text(widget.okText),
        )
      ],
    );
  }
}
