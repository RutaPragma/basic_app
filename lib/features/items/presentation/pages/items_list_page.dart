import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:basic_app/features/items/presentation/widgets/item_card.dart';
import 'package:basic_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemListPage extends StatefulWidget {
  ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  bool shadowColor = false;

  double? scrolledUnderElevation;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ItemsProvider>().loadItems();
    });
  }

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
        itemCount: itemsProvider.items.length,
        padding: const EdgeInsets.only(top: 20),
        itemBuilder: (BuildContext context, int index) {
          final Item item = itemsProvider.items.elementAt(index);

          return ItemCard(
            key: Key('${item.id}'),
            item: item,
            onTap: () => context.push(Routes.itemDetail, extra: item),
            onEdit: () {
              itemsProvider.setItem(item);
              itemsProvider.isEdit = true;
              context.push(Routes.itemForm, extra: item);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () {
          itemsProvider.isNew = true;
          itemsProvider.inicialiceItem();
          context.push(Routes.itemForm);
        },
      ),
    );
  }
}
