import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkUtility {
  static Map<String, String> header = {
    'Content-Type': 'application/json',
  };
  static Future<Response> makeWebServiceGetRequest(
      {required String url}) async {
    final prefs = await Util.sharedPrefs;
    if (prefs.getString(Constant.authToken) != null &&
        prefs.getString(Constant.authToken)!.isNotEmpty) {
      header["Authorization"] =
          "Bearer " + prefs.getString(Constant.authToken)!;
    }
    final response = await http.get(Uri.parse(url), headers: header);
    log("url : " + url);
    log("header : " + jsonEncode(header));
    log("response : " + jsonEncode(response.body));
    return response;
  }

  Future<String> makeWebServiceGetRequestForPagination(
      {required BuildContext context, required String url}) async {
    final prefs = await Util.sharedPrefs;
    if (prefs.getString(Constant.authToken) != null &&
        prefs.getString(Constant.authToken)!.isNotEmpty) {
      header["Authorization"] =
          "Bearer " + prefs.getString(Constant.authToken)!;
    }
    final response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 405) {
      //Session Timeout - User will be logged out from the app
      Util.logout(context);
      throw "Error While Token Expired";
    } else if (response.statusCode != 200 && response.statusCode != 405) {
      throw "Error While Retrieving Data API";
    }
    log("url : " + url);
    log("header : " + jsonEncode(header));
    log("response : " + jsonEncode(response.body));
    return response.body;
  }

  static Future<Response> makeWebServiceRequest(
      {required String url,
      required Map<String, dynamic> body,
      required Map<String, String> header}) async {
    final prefs = await Util.sharedPrefs;
    if (prefs.getString(Constant.authToken) != null &&
        prefs.getString(Constant.authToken)!.isNotEmpty) {
      header["Authorization"] =
          "Bearer " + prefs.getString(Constant.authToken)!;
    }
    final response =
        await http.post(Uri.parse(url), headers: header, body: body);

    log("url : " + url);
    log("header : " + jsonEncode(header));
    log("response : " + jsonEncode(response.body));
    return response;
  }

  Future<String> makeWebServiceRequestJsonBody(
      {required BuildContext context,
      required String url,
      required String body,
      required Map<String, String> header}) async {
    final prefs = await Util.sharedPrefs;
    if (prefs.getString(Constant.authToken) != null &&
        prefs.getString(Constant.authToken)!.isNotEmpty) {
      header["Authorization"] =
          "Bearer " + prefs.getString(Constant.authToken)!;
    }
    log("url : " + url);
    log("header : " + jsonEncode(header));
    final response =
        await http.post(Uri.parse(url), headers: header, body: body);
    log("response : " + jsonEncode(response.body));
    if (response.statusCode == 405) {
      //Session Timeout - User will be logged out from the app
      Util.logout(context);
      throw "Error While Token Expired";
    } else if (response.statusCode != 200 && response.statusCode != 405) {
      log("response status : " + response.statusCode.toString());
      throw "Error While Retrieving Data API";
    }

    // log("response : " + jsonEncode(response.body));
    return response.body;
  }
}
