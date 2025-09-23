import 'package:basic_app/features/items/data/datasources/local/app_database.dart';
import 'package:basic_app/features/items/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({super.key, this.item});

  final Item? item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Atras'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          ItemCard(onTap: () {}, onEdit: () {}, item: null,),
          const Center(child: Text('Formulario add Items')),
        ],
      ),
    );
  }
}
