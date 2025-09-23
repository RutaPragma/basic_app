import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:basic_app/features/items/presentation/widgets/item_card.dart';
import 'package:basic_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  final List<int> _items = List<int>.generate(50, (int index) => index);

  final List<Item> itemsList = [];

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    final itemsProvider = context.watch<ItemsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          language.translate('card_list_page.title'),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 4,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).appBarTheme.backgroundColor!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
            child: Icon(Icons.task, color: Colors.white),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.only(top: 20),
        itemBuilder: (BuildContext context, int index) {
          itemsList.add(
            Item(
              id: index,
              title: 'Mi elemento $index',
              price: double.parse(index.toString()),
              description:
                  'Ipsum sed quia minus dolores ut dignissimos. Nihil laboriosam debitis. Ut explicabo dicta consequatur minus quae. Quibusdam voluptates illum deserunt earum odit expedita ipsum id.',
              category: 'Emmerich, Mills and Hand',
              createdAt: DateTime.now(),
            ),
          );
          final Item item = itemsList.elementAt(index);
          return ItemCard(
            item: item,
            onTap: () => context.push(Routes.itemDetail, extra: item),
            onEdit: () {
              itemsProvider.item = item;
              itemsProvider.isNew = false;
              context.push(Routes.itemForm, extra: item);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () {
          itemsProvider.isNew = true;
          itemsProvider.item = null;
          context.push(Routes.itemForm);
        },
      ),
    );
  }
}
