import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:happy_bark/screens/login/login_screen.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

/*
typedef Sort = int Function(dynamic a, dynamic b);
typedef SortByField = Sort Function(String sortField);
SortByField alphanumeric = (String sortField) => (a, b) {
      return a[sortField].toLowerCase().compareTo(b[sortField].toLowerCase());
    };
SortByField number = (String sortField) => (a, b) {
      return a[sortField].compareTo(b[sortField]);
    };
//   list.sort(alphanumeric('<PUT THE FIELD NAME HERE>'))
//   list.sort(number('<PUT THE FIELD NAME HERE>'))
*/

enum UrlType { image, video, unknown }

class Util {
  static final sharedPrefs = SharedPreferences.getInstance();

  static void log(Object? object) {
    if (kDebugMode) {
      log(jsonEncode(object));
    }
  }

  static void print(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }

  static void displayToast(String messsage, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(messsage),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void logout(BuildContext context) async {
    final prefs = await Util.sharedPrefs;
    // Set<String> allKeys = prefs.getKeys();
    // List<String> exceptKeys = [
    //   Constant.authToken,
    //   Constant.name,
    // ];
    // for (String key in allKeys) {
    //   Util.log('All Keys - $key & Value - ${prefs.get(key).toString()}');
    // }
    // for (var item in exceptKeys) {
    //   if (allKeys.contains(item)) {
    //     allKeys.remove(item);
    //   }
    // }
    // for (String key in allKeys) {
    //   Util.log('Removed Key - $key');
    //   await prefs.remove(key);
    // }
    prefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  static UrlType getUrlType(String url) {
    Uri uri = Uri.parse(url);
    String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();
    if (typeString == 'jpg' || typeString == 'jpeg' || typeString == 'png') {
      return UrlType.image;
    }
    if (typeString == 'mp4') {
      return UrlType.video;
    } else {
      return UrlType.unknown;
    }
  }
}
