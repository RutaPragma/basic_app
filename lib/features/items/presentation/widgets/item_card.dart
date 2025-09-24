import 'package:flutter/material.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.item,
    this.showButtons = false,
    super.key,
  });

  final Item item;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
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
              child: Hero(
                transitionOnUserGestures: true,
                tag: item.id ?? 0,
                child: Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    ((item.id ?? 0) % 2) == 0 ? Icons.apple : Icons.android,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 60,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 140,
              top: 20,
              child: SizedBox(
                width: 220,
                height: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          item.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        subtitle: Text(
                          item.description,
                          maxLines: 4,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    if (showButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: onEdit,
                            icon: CircleAvatar(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              child: Icon(
                                Icons.edit_note,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: onDelete,
                            icon: CircleAvatar(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.error,
                              child: Icon(
                                Icons.clear,
                                color: Theme.of(context).colorScheme.onError,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
