import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/common/di/di.dart';
import 'package:test_app/common/widgets/app_layout.dart';
import 'package:test_app/features/main/domain/collection_item_entity.dart';
import 'package:test_app/features/main/presentation/managers/item_details_cubit.dart';
import 'package:test_app/features/main/presentation/managers/my_collection_cubit.dart';
import 'package:test_app/features/main/presentation/pages/item_details_page.dart';
import 'package:test_app/features/main/presentation/pages/my_collection_page.dart';
import 'package:test_app/main.dart';

class RouteName {
  static const String myCollectionPage = _myCollectionPageName;
  static const String itemDetailsPage = _itemDetailsPageName;
}

const String _myCollectionPageName = 'my_collection';
const String _itemDetailsPageName = 'item_details';

mixin RoutingMixin on State<TestApp> {
  final GoRouter router = appRouter();
}

GoRouter appRouter() => GoRouter(
  initialLocation: '/$_myCollectionPageName',
  restorationScopeId: 'router',
  routes: [
    ShellRoute(
      builder: (final context, final state, final child) {
        return AppLayout(child: child);
      },
      routes: [
        GoRoute(
          name: RouteName.myCollectionPage,
          path: '/$_myCollectionPageName',
          pageBuilder: (final context, final state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: BlocProvider<MyCollectionCubit>(
                create: (final _) => serviceLocator<MyCollectionCubit>(),
                child: MyCollectionPage(),
              ),
            );
          },
        ),
        GoRoute(
          name: RouteName.itemDetailsPage,
          path: '/$_itemDetailsPageName',
          pageBuilder: (final context, final state) {
            final item = state.extra as CollectionItemEntity?;
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: BlocProvider<ItemDetailsCubit>(
                create: (final _) => serviceLocator<ItemDetailsCubit>()..setItem(item ?? CollectionItemEntity.empty),
                child: ItemDetailsPage(),
              ),
            );
          },
        ),
      ],
    ),
  ],
);

Page<T> buildPageWithDefaultTransition<T>({
  required final BuildContext context,
  required final GoRouterState state,
  required final Widget child,
}) => Platform.isIOS ? CupertinoPage(key: state.pageKey, child: child) : MaterialPage(key: state.pageKey, child: child);
