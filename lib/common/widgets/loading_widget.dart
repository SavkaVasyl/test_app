import 'package:flutter/material.dart';
import 'package:test_app/common/resources/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.body, required this.isLoading});

  final Widget body;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        body,
        if (isLoading)
        Positioned.fill(
          child: Container(
            alignment: Alignment.center,
            color: AppColors.whiteO10,
            child: CircularProgressIndicator(color: AppColors.grey1),
          ),
        ),
      ],
    );
  }
}
