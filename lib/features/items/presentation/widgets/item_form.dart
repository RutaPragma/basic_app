import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:basic_app/features/items/presentation/widgets/loader_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => ItemFormState();
}

class ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late final ItemsProvider itemsProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemsProvider = context.read<ItemsProvider>();
      itemsProvider.onSaveCall = saveItem;
      _titleController.text = itemsProvider.item?.title ?? '';
      _descriptionController.text = itemsProvider.item?.description ?? '';
    });

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    itemsProvider.onSaveCall = null;
    super.dispose();
  }

  Future<void> saveItem() async {
    if (_formKey.currentState!.validate()) {
      final Item item = itemsProvider.item!.copyWith();

      if (itemsProvider.isNew) {
        await itemsProvider.addNewItemProvider(
          item.title,
          item.price,
          item.description,
          item.category,
        );
      } else if (itemsProvider.isEdit) {
        print('update1');
        await itemsProvider.updateItemProvider(item);
        print('update2');
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: language.translate('item_form.label_title'),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  itemsProvider.setItem(
                    itemsProvider.item?.copyWith(title: value),
                  );
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return language.translate('item_form.error_title');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: language.translate('item_form.label_description'),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  itemsProvider.setItem(
                    itemsProvider.item?.copyWith(description: value),
                  );
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return language.translate('item_form.error_description');
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
