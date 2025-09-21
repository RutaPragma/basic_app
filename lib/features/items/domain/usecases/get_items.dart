import 'package:basic_app/features/items/domain/repositories/item_repository.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';

class GetItems {
  final ItemRepository repository;
  GetItems(this.repository);

  Future<List<Item>> call() async {
    return await repository.getAllItems();
  }
}
