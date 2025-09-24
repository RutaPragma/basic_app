import 'package:basic_app/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class EmptyItems extends StatelessWidget {
  const EmptyItems({super.key, required this.language});

  final AppLocalizations language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        children: [
          Image.asset(language.translate('card_list_page.image_empty')),
          Text(
            language.translate('card_list_page.empty_text'),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
