import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Atras'),
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
      body: const Center(child: Text('Formulario add Items')),
    );
  }
}
