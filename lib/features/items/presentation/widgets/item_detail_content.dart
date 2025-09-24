import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:flutter/material.dart';

class ItemDetailContent extends StatelessWidget {
  const ItemDetailContent({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          right: 30,
          left: 30,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          top: 140,
          right: 20,
          left: 20,
          child: SizedBox(
            height: 90,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 80,
          right: 80,
          top: 20,
          child: Hero(
            tag: item.id ?? 0,
            transitionOnUserGestures: true,
            child: Container(
              width: 180,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
                border: BoxBorder.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 3,
                ),
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
          left: 20,
          right: 20,
          top: 260,
          bottom: 20,
          child: Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Text(
                item.description,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
