import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:basic_app/features/items/domain/entities/item.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      final item = Item(
        id: DateTime.now().millisecondsSinceEpoch,
        title: _titleController.text.trim(),
        category: '',
        price: 0,
        description: _descriptionController.text.trim(),
        createdAt: DateTime.now(),
      );

      context.read<ItemsProvider>().addItem(item);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(language.translate('item_form.title') ?? 'Nuevo Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo título
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText:
                      language.translate('item_form.label_title') ?? 'Título',
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return language.translate('item_form.error_title') ??
                        'El título es requerido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo descripción
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText:
                      language.translate('item_form.label_description') ??
                      'Descripción',
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return language.translate('item_form.error_description') ??
                        'La descripción es requerida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Botón guardar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _saveItem,
                  icon: const Icon(Icons.save),
                  label: Text(
                    language.translate('item_form.save_button') ?? 'Guardar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
