import 'package:basic_app/features/items/domain/entities/item.dart';

class ItemModel {
  final int? id;
  final String title;
  final double price;
  final String description;
  final String category;
  final DateTime createdAt;

  ItemModel({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.createdAt,
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

  factory ItemModel.fromEntity(Item e) {
    return ItemModel(
      id: e.id == 0 ? null : e.id,
      title: e.title,
      price: e.price,
      description: e.description,
      category: e.category,
      createdAt: e.createdAt,
    );
  }



}
