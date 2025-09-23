import 'package:basic_app/features/items/data/datasources/local/app_database.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:basic_app/features/items/presentation/widgets/item_card.dart';
import 'package:basic_app/features/items/presentation/widgets/item_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemFormPage extends StatelessWidget {
  const ItemFormPage({super.key, this.item});

  final Item? item;
  @override
  Widget build(BuildContext context) {
    final itemsProvider = context.watch<ItemsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Atras'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: () {
            itemsProvider.isNew = false;
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          ItemCard(onTap: () {}, onEdit: () {}),
          const Divider(),
          const ItemForm(),
        ],
      ),
    );
  }
}
