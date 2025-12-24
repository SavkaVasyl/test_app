import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
      child: Scaffold(body: SafeArea(bottom: false, child: child)),
    );
  }
}
