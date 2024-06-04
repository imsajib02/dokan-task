import 'package:flutter/material.dart';

import '../barrels/utils.dart';

extension ExtSizedBox on int {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension ExtFilterTypes on filterTypes {
  bool get isNewest => this == filterTypes.newest;
  bool get isOldest => this == filterTypes.oldest;
  bool get isPriceL2H => this == filterTypes.priceL2H;
  bool get isPriceH2L => this == filterTypes.priceH2L;
  bool get isBestSelling => this == filterTypes.bestSell;
}