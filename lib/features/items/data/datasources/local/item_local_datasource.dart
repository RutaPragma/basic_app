import 'package:basic_app/features/items/data/datasources/local/app_database.dart';
import 'package:basic_app/features/items/data/models/item_model.dart';
import 'package:drift/drift.dart' as drift;

abstract class ItemLocalDatasource {
  Future<List<ItemModel>> getAllItems();
  Future<int> addItem(ItemModel item);
  Future<void> deleteItem(int id);
  Future<void> updateItem(ItemModel item);
  Future<ItemModel?> getItemById(int id);
}

class ItemLocalDatasourceImpl implements ItemLocalDatasource {
  final AppDatabase db;
  ItemLocalDatasourceImpl(this.db);

  @override
  Future<int> addItem(ItemModel item) async {
    final companion = ItemsCompanion(
      title: drift.Value(item.title),
      price: drift.Value(item.price),
      description: drift.Value(item.description),
      category: drift.Value(item.category),
      createdAt: drift.Value(item.createdAt),
    );
    return await db.insertItem(companion);
  }

  @override
  Future<void> deleteItem(int id) async {
    await (db.delete(db.items)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<List<ItemModel>> getAllItems() async {
    final rows = await db.select(db.items).get();
    return rows
        .map(
          (r) => ItemModel(
            id: r.id,
            title: r.title,
            price: r.price,
            description: r.description,
            category: r.category,
            createdAt: r.createdAt,
          ),
        )
        .toList();
  }

  @override
  Future<ItemModel?> getItemById(int id) async {
    final r = await (db.select(
      db.items,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (r == null) return null;
    return ItemModel(
      id: r.id,
      title: r.title,
      price: r.price,
      description: r.description,
      category: r.category,
      createdAt: r.createdAt,
    );
  }

  @override
  Future<void> updateItem(ItemModel itemModel) async {
    await (db.update(
      db.items,
    )..where((t) => t.id.equals(itemModel.id ?? 0))).write(
      ItemsCompanion(
        title: drift.Value(itemModel.title),
        price: drift.Value(itemModel.price),
        description: drift.Value(itemModel.description),
        category: drift.Value(itemModel.category),
        createdAt: drift.Value(itemModel.createdAt),
      ),
    );
  }
}
