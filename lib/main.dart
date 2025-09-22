import 'package:basic_app/app.dart';
import 'package:basic_app/core/di/injector.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<ItemsProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}
