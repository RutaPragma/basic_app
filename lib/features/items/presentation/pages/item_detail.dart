import 'package:basic_app/features/items/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            context.pop(); // o context.pop() si usas GoRouter
          },
        ),
      ),
      body: Center(child: Text(item.description)),
    );
  }
}
