import 'package:flutter/material.dart';
import 'package:test_app/common/resources/colors.dart';

class RippleButton extends StatelessWidget {
  const RippleButton({
    super.key,
    required this.child,
    required this.onTap,
    this.margin = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
    this.border,
    this.background,
  });

  final Widget child;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final Border? border;
  final Color? background;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Material(
          color: AppColors.transparent,
          child: Ink(
            decoration: BoxDecoration(color: background ?? AppColors.white, border: border, borderRadius: borderRadius),
            child: InkWell(
              splashColor: AppColors.transparent,
              onTap: onTap,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
