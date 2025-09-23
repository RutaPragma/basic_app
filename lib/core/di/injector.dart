import 'package:basic_app/features/items/data/datasources/local/app_database.dart';
import 'package:basic_app/features/items/data/datasources/local/item_local_datasource.dart';
import 'package:get_it/get_it.dart';

import 'package:basic_app/features/items/data/repositories/item_repository_impl.dart';
import 'package:basic_app/features/items/domain/repositories/item_repository.dart';

import 'package:basic_app/features/items/domain/usecases/use_cases.dart';
import 'package:basic_app/features/items/presentation/state/items_provider.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Data sources
  getIt.registerLazySingleton<ItemLocalDatasource>(
    () => ItemLocalDatasourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(local: getIt()),
  );

  // UseCases
  getIt.registerFactory(() => GetItems(getIt()));
  getIt.registerFactory(() => AddItem(getIt()));
  getIt.registerFactory(() => GetItemById(getIt()));

  // Providers (state)
  getIt.registerFactory(
    () => ItemsProvider(
      getItems: getIt(),
      addItem: getIt(),
      getItemById: getIt(),
    ),
  );
}
