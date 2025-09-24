import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/data/datasources/local/app_database.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:basic_app/features/items/presentation/widgets/item_card.dart';
import 'package:basic_app/features/items/presentation/widgets/item_form.dart';
import 'package:basic_app/features/items/presentation/widgets/loader_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemFormPage extends StatelessWidget {
  const ItemFormPage({super.key, this.item});

  final Item? item;
  @override
  Widget build(BuildContext context) {
    final itemsProvider = context.watch<ItemsProvider>();
    final language = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(language.translate('item_form.title')),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: () {
            itemsProvider.isNew = false;
            itemsProvider.isEdit = false;
            context.pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.save,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: () {
                itemsProvider.onSaveCall?.call();
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ItemCard(
                onTap: () {},
                onEdit: () {},
                item: itemsProvider.item!.copyWith(
                  id: itemsProvider.item?.id,
                  title: itemsProvider.item?.title,
                  description: itemsProvider.item?.description,
                  category: itemsProvider.item?.category,
                  createdAt: itemsProvider.item?.createdAt,
                ),
              ),
              const Divider(),
              const Expanded(child: ItemForm()),
            ],
          ),
          if (itemsProvider.loading)
            const LoaderScreen(message: "Guardando item..."),
        ],
      ),
    );
  }
}
