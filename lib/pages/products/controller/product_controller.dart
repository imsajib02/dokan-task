import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../barrels/localizations.dart';
import '../../../barrels/models.dart';
import '../../../barrels/utils.dart';

class ProductController extends GetxController {

  var productList = <Product>[].obs;

  var filterOptions = [
    FilterOption(title: STR_NEWEST.tr, isChecked: false, type: filterTypes.newest),
    FilterOption(title: STR_OLDEST.tr, isChecked: false, type: filterTypes.oldest),
    FilterOption(title: STR_PRICE_L2H.tr, isChecked: false, type: filterTypes.priceL2H),
    FilterOption(title: STR_PRICE_H2L.tr, isChecked: false, type: filterTypes.priceH2L),
    FilterOption(title: STR_BEST_SELLING.tr, isChecked: false, type: filterTypes.bestSell),
  ].obs;

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

  void updateFilterOptionCheckedStatus(FilterOption option, bool value) {

    for(int i=0; i<filterOptions.length; i++) {

      if(filterOptions[i].title == option.title) {
        filterOptions[i] = filterOptions[i].copyWith(isChecked: value);
      }
      else {
        filterOptions[i] = filterOptions[i].copyWith(isChecked: false);
      }
    }
  }
}