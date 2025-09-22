import 'package:basic_app/features/items/data/models/item_model.dart';

class ItemModelMapper {
  ItemModel fromMap(Map<String, String> json) {
    return ItemModel(
      id: int.parse(json['id'] ?? ''),
      title: json['title'] ?? '',
      price: double.parse(json['price'] ?? '0'),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      createdAt: DateTime.now(),
    );
  }

  Map<String, String> toMap(ItemModel itemModel) {
    return {
      'id': itemModel.id.toString(),
      'title': itemModel.title.toString(),
      'price': itemModel.price.toString(),
      'description': itemModel.description.toString(),
      'category': itemModel.category.toString(),
      'createdAt': itemModel.createdAt.toString(),
    };
  }
}
