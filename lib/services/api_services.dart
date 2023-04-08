import 'dart:convert';
import 'dart:math';

import 'package:dery_mobileapps/CORE/routes/routes.dart';
import 'package:dery_mobileapps/CORE/widgets/card_widget.dart';
import 'package:dery_mobileapps/GUI/home_page/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../CORE/data_dummy/list_image_dummy.dart';
import '../CORE/widgets/card_item.dart';
import '../model/card_model.dart';

class ApiServices with ChangeNotifier {
  List<CardModel> listData = <CardModel>[];
  List<CardModel> listOrder = <CardModel>[];
  List<CardItem> listWidget = [];
  var listItem = {};
  var client = http.Client();
  Future getApi() async {
    try {
      var response = await http.get(
        Uri.parse('https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/'),
      );
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        print('response: ${decodedResponse}');

        listData = decodedResponse
            .map<CardModel>((e) => CardModel.fromMap(e))
            .toList();
        notifyListeners();

        // print('response: ${cardM}');
        return listData;
        // var uri = Uri.parse(decodedResponse['uri'] as String);
        // print(await client.get(uri));
      }
    } finally {
      client.close();
    }
  }

  Future addApi(String name, String harga) async {
    try {
      var time = DateTime.now().toIso8601String();
      var rnd = Random();
      var id = Random().nextInt(1000);

      var r = 0 + rnd.nextInt(3 - 0);
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
      var request = http.Request('POST',
          Uri.parse('https://apigenerator.dronahq.com/api/g7s7P925/TestAlan'));
      request.body = json.encode({
        "food_code": "FOODS${id}",
        "name": name,
        "price": harga,
        "picture": listImage[r],
        "picture_ori": "",
        "created_at": time
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
        Get.offAll(HomePage());
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      client.close();
    }
    notifyListeners();
  }

  Future updateApi({
    required String id,
    required String name,
    required String harga,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var request = http.Request(
        'PATCH',
        Uri.parse(
            'https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/$id'));
    request.body = json.encode({"name": name, "price": harga});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.offAll(HomePage());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future deleteApi(String id) async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.offAll(HomePage());
    } else {
      print(response.reasonPhrase);
    }
  }

  void addListData(Map model) {
    listItem.addAll(model);
    // listItem.(model);

    notifyListeners();
  }

  void addListOrder(CardModel model) {
    listOrder.add(model);
    notifyListeners();
  }

  void addListCart(CardModel model) {
    listWidget.add(CardItem(model));
    notifyListeners();
  }
}
