import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_bark/models/address/address_list_response.dart';
import 'package:happy_bark/models/products/pincode_check_response.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/text_form_field__for_address.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AddAddressPage extends StatefulWidget {
  AddressListData? addressListData;
  AddAddressPage({Key? key, this.addressListData}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final NetworkUtility _networkUtility = NetworkUtility();
  bool _shouldDisplayLoader = false;
  final _nameTextController = TextEditingController();
  final _mobileNoTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _cityTextController = TextEditingController();
  final _addressOptionalTextController = TextEditingController();
  final _stateTextController = TextEditingController();
  final _pincodeTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? val = false,
      _isCheckedPrimaryAddress = true,
      _isCheckedBillingAddress = true;
  @override
  void initState() {
    if (widget.addressListData != null) {
      _nameTextController.text = widget.addressListData!.fullName ?? '';
      _mobileNoTextController.text = widget.addressListData!.phone ?? '';
      _emailTextController.text = widget.addressListData!.email ?? '';
      _addressTextController.text = widget.addressListData!.address1 ?? '';
      _cityTextController.text = widget.addressListData!.city ?? '';
      _addressOptionalTextController.text =
          widget.addressListData!.address2 ?? '';
      _stateTextController.text = widget.addressListData!.state ?? '';
      _pincodeTextController.text = widget.addressListData!.pincode ?? '';
      _isCheckedPrimaryAddress =
          widget.addressListData!.setPrimary == "true" ? true : false;
      _isCheckedBillingAddress =
          widget.addressListData!.setPrimary == "true" ? true : false;
    }
    super.initState();
  }

  Future<bool> _addAddress() async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "full_name": _nameTextController.text,
      "country": "India",
      "address1": _addressTextController.text,
      "address2": _addressOptionalTextController.text,
      "city": _cityTextController.text,
      "state": _stateTextController.text,
      "phone": _mobileNoTextController.text,
      "email": _emailTextController.text,
      "pincode": _pincodeTextController.text,
      "set_primary": _isCheckedPrimaryAddress! ? "true" : "false",
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.addAddress,
        header: header,
        body: jsonEncode(body));
    //  log("listFormSubmissionDataUrl : " + value);
    var response = PincodeCheckResponse.fromJson(json.decode(value));
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = false;
      });
    }
    if (response.status!) {
      if (mounted) {
        //setState(() {});
        //  _shouldDisplayLoaderForAddCart = false;
        Util.displayToast(
            response.responseMessage ?? AppStrings.somethingWentWrong, context);
      }
      return true;
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
      return false;
    }
  }

  Future<bool> _updateAddress() async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "address_id": widget.addressListData!.id.toString(),
      "full_name": _nameTextController.text,
      "country": "India",
      "address1": _addressTextController.text,
      "address2": _addressOptionalTextController.text,
      "city": _cityTextController.text,
      "state": _stateTextController.text,
      "phone": _mobileNoTextController.text,
      "email": _emailTextController.text,
      "pincode": _pincodeTextController.text,
      "set_primary": _isCheckedPrimaryAddress! ? "true" : "false",
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    log("body : " + jsonEncode(body));
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.updateAddress,
        header: header,
        body: jsonEncode(body));
    //  log("listFormSubmissionDataUrl : " + value);
    var response = PincodeCheckResponse.fromJson(json.decode(value));
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = false;
      });
    }
    if (response.status!) {
      if (mounted) {
        //setState(() {});
        //  _shouldDisplayLoaderForAddCart = false;
        Util.displayToast(
            response.responseMessage ?? AppStrings.somethingWentWrong, context);
      }
      return true;
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FutureDataProvider>(
        builder: (context, dataProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            title: Padding(
              padding: EdgeInsets.only(left: 0),
              child: Container(
                width: 197,
                alignment: Alignment.centerLeft,
                child: const Text(
                  AppStrings.addNewAddress,
                  style: TextStyle(
                      color: CommonColor.greyBottomNavContentColorInactive,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ),
            isback: true,
            actions: [
              Icon(
                Icons.home_outlined,
                //  size: 20,
                color: CommonColor.greyBottomNavContentColorInactive,
              ),
              SizedBox(
                width: 13,
              ),
              SizedBox(
                width: 40,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: [
                      dataProvider.cartCount == 0
                          ? SizedBox()
                          : Positioned(
                              top: 5,
                              right: 2,
                              child: Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CommonColor.redColors),
                                child: Text(dataProvider.cartCount.toString()),
                              )),
                      Positioned(
                        bottom: 15,
                        left: 0,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                          color: CommonColor.greyBottomNavContentColorInactive,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          ),
          body: ModalProgressHUD(
            inAsyncCall: _shouldDisplayLoader,
            progressIndicator: CircularProgressIndicator(
              strokeWidth: 3,
              color: CommonColor.blueBottomNavContentColorActive, //<-- SEE HERE
              backgroundColor:
                  CommonColor.greyBottomNavContentColorInactive, //<-- SEE HERE
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          text: AppStrings.shippingDetails,
                          color: CommonColor.textColorBlack,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _nameTextController,
                        height: 50,
                        hintText: AppStrings.fullName + "*",
                        readOnly: false,
                        maxLine: 1,
                        keyType: TextInputType.text,
                        wordLimit: 50,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _mobileNoTextController,
                        height: 50,
                        hintText: AppStrings.mobileNumber + "*",
                        readOnly: false,
                        maxLine: 1,
                        keyType: TextInputType.number,
                        wordLimit: 10,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _emailTextController,
                        height: 50,
                        hintText: AppStrings.emailID + "*",
                        readOnly: false,
                        maxLine: 1,
                        keyType: TextInputType.emailAddress,
                        wordLimit: 50,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _addressTextController,
                        height: 90,
                        hintText: AppStrings.address + "*",
                        readOnly: false,
                        maxLine: 4,
                        keyType: TextInputType.text,
                        wordLimit: 200,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _addressOptionalTextController,
                        height: 50,
                        hintText: AppStrings.addressLine2,
                        val: false,
                        readOnly: false,
                        maxLine: 1,
                        keyType: TextInputType.text,
                        wordLimit: 100,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _cityTextController,
                        height: 50,
                        hintText: AppStrings.city + "*",
                        readOnly: false,
                        maxLine: 1,
                        keyType: TextInputType.text,
                        wordLimit: 50,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _stateTextController,
                        height: 50,
                        hintText: AppStrings.state + "*",
                        readOnly: false,
                        maxLine: 1,
                        keyType: TextInputType.text,
                        wordLimit: 50,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormFieldForAddressWidget(
                        controller: _pincodeTextController,
                        height: 50,
                        hintText: AppStrings.pincode + "*",
                        readOnly: false,
                        maxLine: 1,
                        keyType: TextInputType.number,
                        wordLimit: 6,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: _isCheckedPrimaryAddress,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              activeColor: CommonColor.textColorBlack,
                              checkColor: CommonColor.whiteColor,
                              onChanged: (val) {
                                setState(
                                  () {
                                    _isCheckedPrimaryAddress = val!;
                                  },
                                );
                              }),
                          TextWidget(
                              text: AppStrings.setAsPrimaryAddress,
                              color: CommonColor.greyAppBarTextColor,
                              maxLine: 1,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: _isCheckedBillingAddress,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              activeColor: CommonColor.textColorBlack,
                              checkColor: CommonColor.whiteColor,
                              onChanged: (val) {
                                setState(
                                  () {
                                    _isCheckedBillingAddress = val!;
                                  },
                                );
                              }),
                          TextWidget(
                              text: AppStrings.thisIsBillingAddress,
                              color: CommonColor.greyAppBarTextColor,
                              maxLine: 1,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.addressListData != null) {
                              _updateAddress().then((value) {
                                Navigator.pop(context, true);
                              });
                            } else {
                              _addAddress().then((value) {
                                Navigator.pop(context, true);
                              });
                            }
                          }
                        },
                        child: Container(
                          height: 43,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:
                                  CommonColor.blueBottomNavContentColorActive),
                          alignment: Alignment.center,
                          child: TextWidget(
                              text: AppStrings.saveAddress,
                              color: CommonColor.whiteColor,
                              maxLine: 1,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
