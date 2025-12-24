import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/common/resources/resources_lib.dart';
import 'package:test_app/common/widgets/loading_widget.dart';
import 'package:test_app/features/main/presentation/managers/item_details_cubit.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final isLoading = context.watch<ItemDetailsCubit>().state.isLoading;
    return Scaffold(
      body: LoadingWidget(
        isLoading: isLoading,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: -100,
              right: -100,
              left: -100,
              child: Image.asset(icBackground, fit: BoxFit.cover),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
                  builder: (final context, final state) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Genesis Collection', style: AppTextStyle.bodySmall()),
                              IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                                  color: AppColors.black2,
                                  child: Row(
                                    children: [
                                      Image.asset(icIcon1, width: 24.w, height: 24.w),
                                      SizedBox(width: 10.w),
                                      Expanded(child: Text('Genuine Bottle (Unopened)', style: AppTextStyle.bodyMedium())),
                                      SizedBox(width: 10.w),
                                      SvgPicture.asset(icArrow, width: 24.w, height: 24.w),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  'assets/icons/${state.item?.image}',
                                  height: 400.h,
                                  width: ScreenUtil().screenWidth,
                                ),
                                if (!state.isLoading && state.item?.details != null)
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                    color: AppColors.black2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Bottle 135/184', style: AppTextStyle.bodySmall(color: AppColors.grey2)),
                                        SizedBox(height: 10.h),
                                        Text(state.item?.title ?? '', style: AppTextStyle.titleLarge()),
                                        SizedBox(height: 20.h),
                                        _ItemDetailsWidget(),
                                      ],
                                    ),
                                  ),
                                SizedBox(height: 16.h + ScreenUtil().bottomBarHeight,)
                              ],
                            ),
                          ),
                        )

                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemDetailsWidget extends StatelessWidget {
  const _ItemDetailsWidget();

  @override
  Widget build(final BuildContext context) {
    final details = context.read<ItemDetailsCubit>().state.item!.details!;
    return Column(
      children: [
        itemRow('Distillery', details.distillery),
        itemRow('Region', details.region),
        itemRow('Type', details.type),
        itemRow('Filled', details.filled),
        itemRow('Bottled', details.bottled),
      ],
    );
  }

  Widget itemRow(final String label, final String value){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyle.bodyMedium(),
          ),
          const Spacer(),
          Text(
            value,
            style:  AppTextStyle.bodyMedium(color: AppColors.grey2),
          ),
        ],
      ),
    );
  }
}
