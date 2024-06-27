import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeProvider extends ChangeNotifier {
  List alist = [];

  void jfun() async {
    String data = await rootBundle.loadString("assets/adhay.json");
    Map<String, dynamic> jdata = jsonDecode(data);
    alist = jdata["adhay"];
    notifyListeners();
  }
}