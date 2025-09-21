import 'package:basic_app/features/items/domain/repositories/item_repository.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/data/datasources/local/item_local_datasource.dart';
import 'package:basic_app/features/items/data/models/item_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDatasource local;

  ItemRepositoryImpl({required this.local});

  @override
  Future<int> addItem(Item item) async {
    final model = ItemModel.fromEntity(item);
    return await local.addItem(model);
  }

  @override
  Future<void> deleteItem(int id) async {
    await local.deleteItem(id);
  }

  @override
  Future<List<Item>> getAllItems() async {
    final models = await local.getAllItems();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Item?> getItemById(int id) async {
    final m = await local.getItemById(id);
    return m?.toEntity();
  }

  @override
  Future<void> updateItem(Item item) async {
    final model = ItemModel.fromEntity(item);
    await local.updateItem(model);
  }
}
