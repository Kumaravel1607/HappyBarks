import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:happy_bark/models/login/login_response.dart';
import 'package:happy_bark/models/login/otp_verify_response.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';
import 'package:happy_bark/widgets/text_form_field_login.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final NetworkUtility _networkUtility = NetworkUtility();
  bool _shouldDisplayLoader = false;

  final _otpTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _mobileNoTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String otp = '';
  List<String> _countryFlags = [
    "assets/images/india.png",
    "assets/images/usa.png",
  ];
  Image? _selectedval;
  @override
  void initState() {
    // _selectedval = _countryFlags[0];
    super.initState();
  }

  int? _value = 0;

  void _setValue(int? value) {
    setState(() {
      _value = value;
    });
  }

  /// Api related methord ///
  Future _login() async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "name": _nameTextController.text,
      "phone": _mobileNoTextController.text
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.loginUrl,
        body: jsonEncode(body),
        header: header);
    var response = LoginResponse.fromJson(json.decode(value));
    log("loginUrl : " + jsonEncode(response));
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = false;
      });
    }

    if (response.status!) {
      if (mounted) {
        setState(() {
          otp = response.responseData!.otp.toString();
        });
      }
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
    }
  }

  Future _otpVerifcation() async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    final prefs = await Util.sharedPrefs;
    //String? authToken = prefs.getString(Constant.authToken);

    Map<String, dynamic> body = {
      "otp": otp,
      "phone": _mobileNoTextController.text
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.verifyUrl,
        body: jsonEncode(body),
        header: header);
    var response = OtpVerifyResponse.fromJson(json.decode(value));
    log("verifyUrl : " + jsonEncode(response));
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = false;
      });
    }

    if (response.status!) {
      if (mounted) {
        setState(() {
          prefs.setString(
              Constant.authToken, response.responseData!.token ?? '');
          prefs.setString(Constant.name, _nameTextController.text);
          Util.displayToast(response.responseData!.msg!, context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavBar(
                    //schedulerBinding: true,
                    )),
          );
        });
      }
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _shouldDisplayLoader,
      progressIndicator: CircularProgressIndicator(
        strokeWidth: 3,
        color: CommonColor.blueBottomNavContentColorActive, //<-- SEE HERE
        backgroundColor:
            CommonColor.greyBottomNavContentColorInactive, //<-- SEE HERE
      ),
      child: Scaffold(
          backgroundColor: CommonColor.whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 43, top: 0, bottom: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.fullHeight! * 0.3175,
                      ),
                      TextWidget(
                          text: AppStrings.loginOrSignup,
                          color: CommonColor.greyAppBarTextColor,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/user.png",
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextFormFieldLoginWidget(
                              controller: _nameTextController,
                              validator: AppStrings.valYourName,
                              hintText: AppStrings.yourName,
                              readOnly: false,
                              maxLine: 1,
                              keyType: TextInputType.text,
                              wordLimit: 50,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/call.png",
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextFormFieldLoginWidget(
                              controller: _mobileNoTextController,
                              validator: AppStrings.valMobileNumber,
                              hintText: AppStrings.mobileNumber,
                              readOnly: false,
                              maxLine: 1,
                              keyType: TextInputType.number,
                              wordLimit: 10,
                              onChanged: (value) {},
                              suffixIcon: SizedBox(
                                child: DropdownButton(
                                  elevation: 1,
                                  //itemHeight: 40,
                                  value: _value,
                                  isExpanded: false,
                                  isDense: true,
                                  underline: Container(),
                                  dropdownColor:
                                      const Color.fromRGBO(57, 56, 69, 1),
                                  onChanged: _setValue,
                                  //  borderRadius: BorderRadius.circular(12),
                                  items: [
                                    for (var i = 0; i < 2; i++)
                                      DropdownMenuItem(
                                          value: i,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(1.0),
                                            child: Image.asset(
                                              _countryFlags[i],
                                              height: 30,
                                              width: 50,
                                            ),
                                          ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // _shouldDisplayLoader
                      //     ? CircularProgressIndicator()
                      //     :
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _login().then(
                                (value) => openBottomSheetForOtpVerification());
                          }
                        },
                        child: Container(
                          height: 47,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:
                                  CommonColor.blueBottomNavContentColorActive),
                          alignment: Alignment.center,
                          child: TextWidget(
                              text: AppStrings.continuetxt,
                              color: CommonColor.whiteColor,
                              maxLine: 100,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavBar(
                                    //schedulerBinding: true,
                                    )),
                          );
                        },
                        child: TextWidget(
                            text: AppStrings.skipForNow,
                            color: CommonColor.greyAppBarTextColor,
                            maxLine: 100,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: AppStrings.loginContentText,
                              color: CommonColor.greyAppBarTextColor,
                              maxLine: 2,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                          SizedBox(width: 3),
                          TextWidget(
                              text: AppStrings.termsOfService,
                              color: CommonColor.greyAppBarTextColor,
                              maxLine: 1,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: AppStrings.privacyPolicy + ' & ',
                              color: CommonColor.greyAppBarTextColor,
                              maxLine: 1,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                          SizedBox(width: 3),
                          TextWidget(
                              text: AppStrings.contentPolicy,
                              color: CommonColor.greyAppBarTextColor,
                              maxLine: 1,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Future<bool> openBottomSheetForOtpVerification() async {
    bool _shouldDisplayLoaderBottomSheet = false;
    final _formKeyBottomSheet = GlobalKey<FormState>();
    return await showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                    height: SizeConfig.fullHeight! * 0.65,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 43, top: 30, bottom: 25),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKeyBottomSheet,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(
                                    text: AppStrings.enterOTP,
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                    text: AppStrings.enterOTPMsgText,
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 2,
                                    textAlign: TextAlign.center,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/call.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextFormFieldLoginWidget(
                                        controller: _mobileNoTextController,
                                        validator: AppStrings.valMobileNumber,
                                        hintText: AppStrings.mobileNumber,
                                        readOnly: true,
                                        maxLine: 1,
                                        keyType: TextInputType.number,
                                        wordLimit: 10,
                                        onChanged: (value) {},
                                        suffixIcon: SizedBox(
                                          child: DropdownButton(
                                            elevation: 1,
                                            //itemHeight: 40,
                                            value: _value,
                                            isExpanded: false,
                                            isDense: true,
                                            underline: Container(),
                                            dropdownColor: const Color.fromRGBO(
                                                57, 56, 69, 1),
                                            onChanged: _setValue,
                                            //  borderRadius: BorderRadius.circular(12),
                                            items: [
                                              for (var i = 0; i < 2; i++)
                                                DropdownMenuItem(
                                                    value: i,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.0),
                                                      child: Image.asset(
                                                        _countryFlags[i],
                                                        height: 30,
                                                        width: 50,
                                                      ),
                                                    ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.password_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextFormFieldLoginWidget(
                                        controller: _otpTextController,
                                        validator: AppStrings.valOTP,
                                        hintText: AppStrings.enterOTP,
                                        readOnly: false,
                                        maxLine: 1,
                                        keyType: TextInputType.number,
                                        wordLimit: 6,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                _shouldDisplayLoaderBottomSheet
                                    ? CircularProgressIndicator()
                                    : GestureDetector(
                                        onTap: () {
                                          if (_formKeyBottomSheet.currentState!
                                              .validate()) {
                                            setState(() {
                                              _shouldDisplayLoaderBottomSheet =
                                                  true;
                                            });

                                            _otpVerifcation().then((value) {
                                              _shouldDisplayLoaderBottomSheet =
                                                  false;
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 47,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: CommonColor
                                                  .blueBottomNavContentColorActive),
                                          alignment: Alignment.center,
                                          child: TextWidget(
                                              text: AppStrings.verifyAndProceed,
                                              color: CommonColor.whiteColor,
                                              maxLine: 100,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                        text: AppStrings.didntReceiveOTP,
                                        color: CommonColor.greyAppBarTextColor,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        _login().then((value) =>
                                            openBottomSheetForOtpVerification());
                                      },
                                      child: TextWidget(
                                          text: AppStrings.resend,
                                          color: CommonColor
                                              .blueBottomNavContentColorActive,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: TextWidget(
                                      text: AppStrings.goBack,
                                      color: CommonColor.greyAppBarTextColor,
                                      maxLine: 100,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
              });
            }) ??
        false; //if showDialouge had returned null, then return false
  }
}
