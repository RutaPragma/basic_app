import 'dart:convert';

import 'package:basic_app/features/items/data/mapper/item_model_mapper.dart';
import 'package:basic_app/features/items/data/models/item_model.dart';
import 'package:basic_app/features/items/presentation/pages/pages.dart';
import 'package:basic_app/routes/routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      name: 'item_card',
      builder: (context, state) => const CardList(),
    ),
    GoRoute(
      path: Routes.itemDetail,
      name: 'item_detail',
      builder: (context, state) {
        final item = state.extra is ItemModel
            ? state.extra as ItemModel
            : ItemModelMapper().fromMap(json.decode(state.extra.toString()));
        return ItemDetail(item: item);
      },
    ),
    GoRoute(
      path: Routes.itemForm,
      name: 'Form',
      builder: (context, state) => const ItemForm(),
    ),
  ],
);
