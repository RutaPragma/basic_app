import 'package:basic_app/features/items/domain/repositories/item_repository.dart';

class DeleteItem {
  final ItemRepository repository;
  DeleteItem(this.repository);

  Future<void> call(int id) async {
    return await repository.deleteItem(id);
  }
}
