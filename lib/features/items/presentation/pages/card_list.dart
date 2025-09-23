import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/presentation/widgets/item_card.dart';
import 'package:basic_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  final List<int> _items = List<int>.generate(50, (int index) => index);

  final List<Item> itemsList = [];

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
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
            onEdit: () => context.push(Routes.itemForm, extra: item),
          );
        },
      ),

      // body: GridView.builder(
      //   itemCount: _items.length,
      //   padding: const EdgeInsets.all(5.0),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 1,
      //     childAspectRatio: 2.0,
      //     mainAxisSpacing: 20.0,
      //     crossAxisSpacing: 10.0,
      //   ),
      //   itemBuilder: (BuildContext context, int index) {
      //     itemsList.add(
      //       Item(
      //         id: index,
      //         title: 'Mi elemento $index',
      //         price: double.parse(index.toString()),
      //         description:
      //             'Ipsum sed quia minus dolores ut dignissimos. Nihil laboriosam debitis. Ut explicabo dicta consequatur minus quae. Quibusdam voluptates illum deserunt earum odit expedita ipsum id.',
      //         category: 'Emmerich, Mills and Hand',
      //         createdAt: DateTime.now(),
      //       ),
      //     );

      //     final Item item = itemsList.elementAt(index);

      //     return ItemCard(
      //       item: item,
      //       onTap: () => context.push(Routes.itemDetail, extra: item),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () => context.push(Routes.itemForm),
      ),
    );
  }
}
