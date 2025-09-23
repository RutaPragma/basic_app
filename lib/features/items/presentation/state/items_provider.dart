import 'package:flutter/material.dart';

import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/domain/usecases/use_cases.dart';

class ItemsProvider extends ChangeNotifier {
  final GetItems getItems;
  final AddItem addItem;
  final GetItemById getItemById;
  final UpdateItem updateItem;

  ItemsProvider({
    required this.getItems,
    required this.addItem,
    required this.getItemById,
    required this.updateItem,
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

  Future<void> addNewItemProvider(
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

    _loading = true;
    _error = null;

    try {
      await addItem(item);
      await loadItems();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<Item?> findById(int id) => getItemById(id);

  Future<void> updateItemProvider(Item item) async {
    _loading = true;
    _error = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {
      print("Han pasado 2 segundos");
    });
    try {
      await updateItem(item);
      await loadItems();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
