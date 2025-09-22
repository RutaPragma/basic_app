import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.item});

  final ItemModel item;

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
          Container(
            width: 400,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: Text(item.title),
          ),
          Center(child: Text(item.description)),
        ],
      ),
    );
  }
}
