import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag:
              '${language.translate('item_detail_page.tag_card_list')}${item.id}',
          child: Text(item.title),
        ),

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
      body: Column(
        children: [
          Card(child: Text(item.title)),
          Center(child: Text(item.description)),
        ],
      ),
    );
  }
}
