import 'package:basic_app/features/items/domain/entities/item.dart';

class ItemModel extends Item {
  ItemModel({
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.createdAt,
    super.id,
  });

  Item toEntity() {
    return Item(
      id: id ?? 0,
      title: title,
      price: price,
      description: description,
      category: category,
      createdAt: createdAt,
    );
  }

  factory ItemModel.fromEntity(Item item) {
    return ItemModel(
      id: item.id == 0 ? null : item.id,
      title: item.title,
      price: item.price,
      description: item.description,
      category: item.category,
      createdAt: item.createdAt,
    );
  }
}
