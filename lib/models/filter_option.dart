class FilterOption {

  final String title;
  final bool isChecked;

  FilterOption({required this.title, required this.isChecked});

  FilterOption copyWith({String? title, bool? isChecked}) {

    return FilterOption(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}