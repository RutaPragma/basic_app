import 'package:basic_app/features/items/domain/entities/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getAllItems();
  Future<Item?> getItemById(int id);
  Future<int> addItem(Item item); // returns new id
  Future<void> deleteItem(int id);
  Future<void> updateItem(Item item);
}
