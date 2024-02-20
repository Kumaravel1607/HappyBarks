import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';

class ProductApiService {
  static Future<String> getProductDetailData(
      BuildContext context, int id) async {
    final response = await NetworkUtility.makeWebServiceGetRequest(
      url: UrlConstant.productDetail + '/$id',
    );

    if (response.statusCode == 405) {
      //Session Timeout - User will be logged out from the app
      Util.logout(context);
    } else if (response.statusCode != 200 && response.statusCode != 405) {
      throw "Error While Retrieving Data API";
    }

    return response.body;
  }
}
