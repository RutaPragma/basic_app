import 'package:flutter/material.dart';

import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/domain/usecases/use_cases.dart';

class ItemsProvider extends ChangeNotifier {
  final GetItems getItems;
  final AddItem addItem;
  final GetItemById getItemById;

  ItemsProvider({
    required this.getItems,
    required this.addItem,
    required this.getItemById,
  });

  List<Item> _items = [];
  Item? _item;
  bool _loading = false;
  bool _isNew = false;
  String? _error;

  List<Item> get items => _items;
  Item? get item => _item;
  bool get loading => _loading;
  bool get isNew => _isNew;
  String? get error => _error;

  set item(Item? item) {
    _item = item;
    notifyListeners();
  }

  set isNew(bool isNew) {
    _isNew = isNew;
    notifyListeners();
  }

  Future<void> loadItems() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _items = await getItems();
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> addNewItem(
    String title,
    double price,
    String description,
    String category,
  ) async {
    final item = Item(
      id: 0,
      title: title,
      price: price,
      description: description,
      category: category,
      createdAt: DateTime.now(),
    );
    try {
      await addItem(item);
      await loadItems();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<Item?> findById(int id) => getItemById(id);
}
