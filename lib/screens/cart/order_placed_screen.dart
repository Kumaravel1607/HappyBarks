import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';
import 'package:happy_bark/widgets/text_widget.dart';

class OrderPalcedPage extends StatefulWidget {
  const OrderPalcedPage({Key? key, required this.success}) : super(key: key);

  final bool success;

  @override
  State<OrderPalcedPage> createState() => _OrderPalcedPageState();
}

class _OrderPalcedPageState extends State<OrderPalcedPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: widget.success
              ? TextWidget(
                  text: "Order Placed Successfully !!!",
                  color: CommonColor.textColorGreen,
                  maxLine: 1,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 15)
              : TextWidget(
                  text: "Order Failed",
                  color: CommonColor.redColors,
                  maxLine: 1,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            ///Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const BottomNavBar()),
                (route) => false);
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: CommonColor.blueBottomNavContentColorActive),
            child: TextWidget(
                text: "Continue",
                color: CommonColor.whiteColor,
                maxLine: 1,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
        ),
      ),
    );
  }
}
