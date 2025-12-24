import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/common/di/di.dart';
import 'package:test_app/common/managers/error_handling_cubit.dart';
import 'package:test_app/l10n/app_localizations.dart';

import 'common/data/exception.dart';
import 'common/resources/app_theme.dart';
import 'common/routing/routing.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> with RoutingMixin {
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<ErrorHandlingCubit>(create: (final _) => serviceLocator<ErrorHandlingCubit>())],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (final context, final child) => MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Test app',
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          builder: (final context, final child) => BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
            listenWhen: (final prev, final next) => prev.error != next.error && next.error != null,
            listener: (final context, final state) {
              final message = state.error is NetworkFailure
                  ? (state.error! as NetworkFailure).message
                  : state.error is PlatformException
                  ? (state.error! as PlatformException).message
                  : '';
              debugPrint('message----$message');
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
