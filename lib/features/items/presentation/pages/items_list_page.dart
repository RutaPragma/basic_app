import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/presentation/helper/show_dialog.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:basic_app/features/items/presentation/widgets/widgets.dart';
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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Icon(Icons.task, color: Colors.white),
          ),
        ],
      ),

      body: Builder(
        builder: (_) {
          if (itemsProvider.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (itemsProvider.error != null) {
            return Center(child: Text('${itemsProvider.error}'));
          }
          if (itemsProvider.items.isEmpty) {
            return EmptyItems(language: language);
          }

          return ListView.builder(
            itemCount: itemsProvider.items.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (BuildContext context, int index) {
              return Selector<ItemsProvider, Item>(
                selector: (_, provider) => provider.items[index],
                builder: (_, item, __) {
                  return ItemCard(
                    key: Key('${item.id}'),
                    item: item,
                    onTap: () => context.push(Routes.itemDetail, extra: item),
                    onEdit: () async {
                      itemsProvider.setItem(item);
                      itemsProvider.isEdit = true;
                      await context.push(Routes.itemForm, extra: item);
                      await context.read<ItemsProvider>().loadItems();
                    },
                    onDelete: () => showConfirmDialog(
                      context: context,
                      title: language.translate('confirm_dialog_delete.title'),
                      message:
                          '${language.translate('confirm_dialog_delete.message')} ${item.title}?',
                      confirmText: language.translate(
                        'confirm_dialog_delete.confirm_text',
                      ),
                      cancelText: language.translate(
                        'confirm_dialog_delete.cancel_text',
                      ),
                      onConfirm: () async {
                        await context.read<ItemsProvider>().deleteItem(
                          item.id ?? 0,
                        );
                        await context.read<ItemsProvider>().loadItems();
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          itemsProvider.isNew = true;
          itemsProvider.inicialiceItem();
          await context.push(Routes.itemForm);
          await context.read<ItemsProvider>().loadItems();
        },
      ),
    );
  }
}
