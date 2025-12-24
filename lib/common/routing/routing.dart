import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/features/main/presentation/pages/my_collection_page.dart';
import 'package:test_app/main.dart';

class RouteName {
  static const String myCollectionPage = _myCollectionPageName;
}

const String _myCollectionPageName = 'my_collection';

mixin RoutingMixin on State<TestApp> {
  final GoRouter router = appRouter();
}

GoRouter appRouter() => GoRouter(
  initialLocation: '/$_myCollectionPageName',
  restorationScopeId: 'router',
  routes: [
    GoRoute(
      name: RouteName.myCollectionPage,
      path: '/$_myCollectionPageName',
      pageBuilder: (final context, final state) {
        return buildPageWithDefaultTransition<void>(context: context, state: state, child: MyCollectionPage());
      },
    ),
  ],
);

Page<T> buildPageWithDefaultTransition<T>({
  required final BuildContext context,
  required final GoRouterState state,
  required final Widget child,
}) =>
    Platform.isIOS ? CupertinoPage(key: state.pageKey, child: child) : MaterialPage(key: state.pageKey, child: child);
