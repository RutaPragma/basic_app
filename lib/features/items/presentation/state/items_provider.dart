import 'package:flutter/material.dart';

import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/domain/usecases/use_cases.dart';

class ItemsProvider extends ChangeNotifier {
  final GetItems getItems;
  final AddItem addItem;
  final GetItemById getItemById;
  final UpdateItem updateItem;
  final DeleteItem deleteItem;

  ItemsProvider({
    required this.getItems,
    required this.addItem,
    required this.getItemById,
    required this.updateItem,
    required this.deleteItem,
  });

  List<Item> _items = [];
  Item? _item;

  bool _loading = false;
  bool isNew = false;
  bool isEdit = false;
  String? _error;
  VoidCallback? onSaveCall;
  VoidCallback? onEditCall;

  List<Item> get items => _items;
  bool get loading => _loading;
  String? get error => _error;

  Item? get item => _item;

  setItem(Item? item) {
    _item = item;
    notifyListeners();
  }

  inicialiceItem() {
    _item = Item(
      id: DateTime.now().millisecondsSinceEpoch,
      title: '',
      category: '',
      price: 0,
      description: '',
      createdAt: DateTime.now(),
    );
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

  Future<void> addNewItemProvider(Item item) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      await addItem(item);
    } catch (e) {
      _error = e.toString();
    }
    isNew = false;
    _loading = false;
    notifyListeners();
  }

  Future<Item?> findById(int id) => getItemById(id);

  Future<void> updateItemProvider(Item item) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      await updateItem(item);
    } catch (e) {
      _error = e.toString();
    }
    isEdit = false;
    _loading = false;
    notifyListeners();
  }
}
