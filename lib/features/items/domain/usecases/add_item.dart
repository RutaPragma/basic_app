import 'package:basic_app/features/items/domain/repositories/item_repository.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';

class AddItem {
  final ItemRepository repository;
  AddItem(this.repository);

  Future<int> call(Item item) async {
    return await repository.addItem(item);
  }
}
