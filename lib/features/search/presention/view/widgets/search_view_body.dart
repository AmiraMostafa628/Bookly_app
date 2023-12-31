import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/features/search/presention/view/widgets/custom_search_app_bar.dart';
import 'package:bookly_app/features/search/presention/view/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presention/view/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchAppBarView(),
          SizedBox(
            height: AppSize.s10,
          ),
          CustomSearchTextField(),
          SizedBox(
            height: AppSize.s16,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}


