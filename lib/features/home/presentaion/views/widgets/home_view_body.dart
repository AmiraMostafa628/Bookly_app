import 'package:bookly_app/core/utils/style_manager.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: CustomAppBar(),
              ),
              FeaturedListView(),
              SizedBox(
                height: AppSize.s40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Text(
                  'Newest Books',
                  style: Styles.testStyle18,
                ),
              ),
              SizedBox(
                height: AppSize.s20,
              ),

            ],
          ),
        ),
        SliverToBoxAdapter(
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: NewestBooksListView(),
          ),
        )
      ],
    );
  }
}




