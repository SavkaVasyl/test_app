import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/common/resources/resources_lib.dart';
import 'package:test_app/common/routing/routing.dart';
import 'package:test_app/common/widgets/ripple_button.dart';
import 'package:test_app/features/main/domain/collection_item_entity.dart';
import 'package:test_app/features/main/presentation/managers/my_collection_cubit.dart';
import 'package:test_app/l10n/app_localizations.dart';

class MyCollectionPage extends StatelessWidget {
  const MyCollectionPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.myCollection, style: AppTextStyle.headLineLarge()),
              IconButton(
                onPressed: () {
                  //todo open notification
                },
                icon: Icon(Icons.notifications_outlined),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<MyCollectionCubit, MyCollectionState>(
            builder: (final context, final state) {
              if (state.isLoading) return Center(child: CircularProgressIndicator(color: AppColors.grey1));
              return GridView.builder(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 16.h,
                  bottom: 16.h + ScreenUtil().bottomBarHeight,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 0.54,
                ),
                itemCount: state.items.length,
                itemBuilder: (final context, final index) {
                  final item = state.items[index];
                  return _ItemCard(item: item);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({required this.item});

  final CollectionItemEntity item;

  @override
  Widget build(final BuildContext context) {
    return RippleButton(
      onTap: () {
        context.pushNamed(RouteName.itemDetailsPage, extra: item);
      },
      background: AppColors.black1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset('assets/icons/${item.image}')),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: AppTextStyle.titleLarge()),
                Text('1992#1234', style: AppTextStyle.titleLarge()),
                SizedBox(height: 4.h),
                Text('(112/158)', style: AppTextStyle.bodySmall()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
