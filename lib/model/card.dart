class Card {
  final String id;
  final String title;
  final String category;
  final String? description;
  final bool isUse;

  Card({
    required this.id,
    required this.title,
    required this.category,
    this.description,
    required this.isUse,
  });

  Card copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    bool? isUse,
  }) => Card(
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
}
