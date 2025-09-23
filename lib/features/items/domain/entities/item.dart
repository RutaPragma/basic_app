class Item {
  const Item({
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.createdAt,
    this.id,
  });

  final int? id;
  final String title;
  final double price;
  final String description;
  final String category;
  final DateTime createdAt;

  Item copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    DateTime? createdAt,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
