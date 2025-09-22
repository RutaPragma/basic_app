import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/data/models/item_model.dart';
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

  final List<int> _items = List<int>.generate(300, (int index) => index);

  final List<ItemModel> itemsModelList = [];

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

      body: GridView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          itemsModelList.add(
            ItemModel(
              id: index,
              title: 'Mi elemento $index',
              price: double.parse(index.toString()),
              description:
                  'Ipsum sed quia minus dolores ut dignissimos. Nihil laboriosam debitis. Ut explicabo dicta consequatur minus quae. Quibusdam voluptates illum deserunt earum odit expedita ipsum id.',
              category: 'Emmerich, Mills and Hand',
              createdAt: DateTime.now(),
            ),
          );

          final ItemModel itemModel = itemsModelList.elementAt(index);

          return GestureDetector(
            onTap: () => context.push(Routes.itemDetail, extra: itemModel),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: Hero(
                tag:
                    '${language.translate('card_list_page.tag_card_list')}$index',
                flightShuttleBuilder:
                    (
                      flightContext,
                      animation,
                      direction,
                      fromContext,
                      toContext,
                    ) {
                      return DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        child: (direction == HeroFlightDirection.push)
                            ? toContext.widget
                            : fromContext.widget,
                      );
                    },
                child: Text(itemModel.title),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () => context.push(Routes.itemForm),
      ),
    );
  }
}
