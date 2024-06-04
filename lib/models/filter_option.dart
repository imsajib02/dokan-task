import '../barrels/utils.dart';

class FilterOption {

  final String title;
  final bool isChecked;
  final filterTypes type;

  FilterOption({required this.title, required this.isChecked, required this.type});

  FilterOption copyWith({String? title, bool? isChecked, filterTypes? type}) {

    return FilterOption(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
      type: type ?? this.type,
    );
  }
}