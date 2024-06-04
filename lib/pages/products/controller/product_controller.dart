import 'dart:convert';

import 'package:flutter/material.dart';
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

  final scrollController = ScrollController();

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

  void validateFiltering() {

    Get.back(closeOverlays: true);

    var result = filterOptions.where((item) => item.isChecked);

    if(result.isEmpty) {
      _showSnackBar(STR_OOPS.tr, STR_SELECT_FILTER_OPTION.tr);
      return;
    }

    _filterProducts(result.first);
  }

  void _filterProducts(FilterOption option) {

    if(option.type.isNewest) {
      productList.sort((a, b) => DateTime.parse(b.createDate!).compareTo(DateTime.parse(a.createDate!)));
    }

    if(option.type.isOldest) {
      productList.sort((a, b) => DateTime.parse(a.createDate!).compareTo(DateTime.parse(b.createDate!)));
    }

    if(option.type.isPriceL2H) {
      productList.sort((a, b) => double.parse(a.price!).compareTo(double.parse(b.price!)));
    }

    if(option.type.isPriceH2L) {
      productList.sort((a, b) => double.parse(b.price!).compareTo(double.parse(a.price!)));
    }

    if(option.type.isBestSelling) {
      productList.sort((a, b) => b.totalSale!.compareTo(a.totalSale!));
    }

    _scrollToTop();
  }

  void _scrollToTop() {
    scrollController.animateTo(scrollController.position.minScrollExtent, duration: Duration(milliseconds: 800), curve: Curves.easeOut);
  }

  void _showSnackBar(String title, message, {bool isErrorMsg = false}) {

    Get.snackbar(title, message,
      margin: EdgeInsets.all(15),
      duration: const Duration(milliseconds: 3500),
      colorText: isErrorMsg ? Colors.white : null,
      backgroundColor: isErrorMsg ? Colors.redAccent : null,
    );
  }
}