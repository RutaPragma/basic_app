import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemCard({required this.item, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    return Card(
      child: Hero(
        tag: '${language.translate('card_list_page.tag_card_list')}${item.id}',
        flightShuttleBuilder:
            (flightContext, animation, direction, fromContext, toContext) {
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
        child: ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          onTap: onTap,
        ),
      ),
    );
  }
}
