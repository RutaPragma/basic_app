import 'package:basic_app/features/items/domain/entities/item.dart';

class ItemMapper {
  Item fromMap(Map<String, String> json) {
    return Item(
      id: int.parse(json['id'] ?? ''),
      title: json['title'] ?? '',
      price: double.parse(json['price'] ?? '0'),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      createdAt: DateTime.now(),
    );
  }

  Map<String, String> toMap(Item item) {
    return {
      'id': item.id.toString(),
      'title': item.title.toString(),
      'price': item.price.toString(),
      'description': item.description.toString(),
      'category': item.category.toString(),
      'createdAt': item.createdAt.toString(),
    };
  }
}
