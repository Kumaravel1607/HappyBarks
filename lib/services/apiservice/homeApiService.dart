import 'package:flutter/cupertino.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';

class HomeApiService {
  static Future<String> getHomeData(BuildContext context) async {
    final response =
        await NetworkUtility.makeWebServiceGetRequest(url: UrlConstant.home);
    if (response.statusCode == 405) {
      //Session Timeout - User will be logged out from the app
      Util.logout(context);
    } else if (response.statusCode != 200 && response.statusCode != 405) {
      throw "Error While Retrieving Data API";
    }
    return response.body;
  }
}
