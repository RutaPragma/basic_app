import 'dart:convert';
import 'dart:ui';

import 'package:basic_app/features/items/data/models/item_model.dart';
import 'package:basic_app/features/items/domain/mapper/item_mapper.dart';
import 'package:basic_app/features/items/presentation/pages/pages.dart';
import 'package:basic_app/routes/routes.dart';
import 'package:flutter/material.dart';
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
      pageBuilder: (context, state) {
        final item = state.extra is ItemModel
            ? state.extra as ItemModel
            : ItemMapper().fromMap(json.decode(state.extra.toString()));

        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 600),
          child: ItemDetail(item: item),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: Routes.itemForm,
      name: 'Form',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ItemForm(),
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeOutCubic));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
