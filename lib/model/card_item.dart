import 'package:flutter_card_ui_app_ex01/exceptions/card_item_exception.dart';

class CardItem {
  final String id;
  final String title;
  final String category;
  final String? description;
  final bool isUse;

  CardItem({
    required this.id,
    required this.title,
    required this.category,
    this.description,
    required this.isUse,
  });

  CardItem copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    bool? isUse,
  }) => CardItem(
    id: id ?? this.id,
    title: title ?? this.title,
    category: category ?? this.category,
    description: description ?? this.description,
    isUse: isUse ?? this.isUse,
  );

  bool isValid() {
    if (id.isEmpty || title.trim().isEmpty) {
      return false;
    }

    return true;
  }

  void validate() {
    if (id.isEmpty) {
      throw CardItemIdEmptyException();
    }

    if (title.isEmpty) {
      throw CardTitleEmptyException();
    }
  }
}
