import 'dart:convert';
import 'dart:io';

import 'package:hanaromart/data/models/address.dart';
import 'package:hanaromart/data/models/shopItem.dart';
import 'package:http/http.dart' as http;

class CustomJsonService {
  Future<List<ShopModel>> fetchStore() async {
    final uriResponse = await http.get(
      Uri.parse("http://www.hanaromartapp.com/api/store"),
    );
    if (uriResponse.statusCode == 200) {
      var json = jsonDecode(uriResponse.body);
      List storeList = json["data"]["storeList"] as List;

      return storeList.map((e) => ShopModel.fromJson(e)).toList();
    } else {
      throw HttpException(
        'Unexpected status code ${uriResponse.statusCode}:'
        ' ${uriResponse.reasonPhrase}',
      );
    }
  }

  Future<List<Address>> fetchAddress() async {
    final uriResponse = await http.get(
      Uri.parse("http://www.hanaromartapp.com/api/lname"),
    );
    if (uriResponse.statusCode == 200) {
      var json = jsonDecode(uriResponse.body);

      List t = json["data"]["lnameList"] as List;
      return t.map((e) => Address.fromJson(e)).toList();
    } else {
      throw HttpException(
        'Unexpected status code ${uriResponse.statusCode}:'
        ' ${uriResponse.reasonPhrase}',
      );
    }
  }

  //string ==> ex>Address.fromJson(model)
}
