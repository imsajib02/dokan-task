import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../barrels/models.dart';

class ProductController extends GetxController {

  var productList = <Product>[].obs;

  @override
  void onInit() {
    _getProducts();
    super.onInit();
  }

  Future<void> _getProducts() async {

    String jsonStringValues = await rootBundle.loadString('assets/products/response.json');
    var jsonData = json.decode(jsonStringValues);

    productList.value = List<Product>.from(jsonData.map((json) => Product.fromJson(json)));
  }
}