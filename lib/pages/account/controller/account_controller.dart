import 'package:get/get.dart';

class AccountController extends GetxController {

  var isExpanded = [false, false, false, false].obs;

  void toggleExpansionStatus(int position) => isExpanded[position] = !isExpanded[position];
}