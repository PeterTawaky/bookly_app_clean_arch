import 'package:bookly_app/core/config/app_assets.dart';
import 'package:bookly_app/core/config/app_strings.dart';
import 'package:bookly_app/core/theme/app_text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_box_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(),
                FeaturedBoxListView(listHeight: 250.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.bestSeller,
                    style: AppTextStyles.textStyle20,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          const BestSellerListView(),
        ],
      ),
    );
  }
}
