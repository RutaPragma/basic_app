import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  ItemCard({required this.onTap, required this.onEdit, this.item, super.key});

  Item? item;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);
    final itemsProvider = context.watch<ItemsProvider>();
    item ??= itemsProvider.item;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Positioned(
              top: 15,
              right: 20,
              child: Container(
                width: 300,
                height: 220,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 45,
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  ((item?.id ?? 0) % 2) == 0 ? Icons.apple : Icons.android,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 60,
                ),
              ),
            ),
            Positioned(
              left: 140,
              top: 35,
              child: SizedBox(
                width: 200,
                height: 180,
                child: Hero(
                  tag:
                      '${language.translate('card_list_page.tag_card_list')}${item?.id}',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            item?.title ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          subtitle: Text(
                            item?.description ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      !itemsProvider.isNew
                          ? IconButton(
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: onEdit,
                              icon: CircleAvatar(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surface,
                                child: Icon(
                                  Icons.edit_note,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
