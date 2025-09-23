import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/domain/repositories/item_repository.dart';

class UpdateItem {
  final ItemRepository repository;

  UpdateItem(this.repository);

  Future<void> call(Item item) async {
    return await repository.updateItem(item);
  }
}
