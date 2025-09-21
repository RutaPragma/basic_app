import 'package:flutter/material.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemCard({required this.item, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: Text('${item.createdAt.toLocal()}'.split(' ')[0]),
        onTap: onTap,
      ),
    );
  }
}
