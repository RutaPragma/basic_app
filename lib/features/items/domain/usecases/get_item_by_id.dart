import 'package:basic_app/features/items/domain/repositories/item_repository.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';

class GetItemById {
  final ItemRepository repository;
  GetItemById(this.repository);

  Future<Item?> call(int itemId) async {
    return await repository.getItemById(itemId);
  }
}
