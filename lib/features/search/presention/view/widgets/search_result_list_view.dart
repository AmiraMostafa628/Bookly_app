import 'package:bookly_app/core/utils/style_manager.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/newest_book_loading.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/newest_books_List_view_item.dart';
import 'package:bookly_app/features/search/presention/view_model/cubit.dart';
import 'package:bookly_app/features/search/presention/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit,SearchBooksStates>(
      builder: (context,state){
        const Text(
          'Search Result',
          style: Styles.testStyle18,
        );
        const SizedBox(
          height: AppSize.s16,
        );
        if(state is SearchBooksSuccessStates)
        {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index)=> Padding(
              padding:const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: BookListViewItem(bookModel:state.books[index] ,),
            ),
            itemCount: state.books.length,
          );
        }
        else if(state is SearchBooksLoadingStates)
        {
          return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context,state) =>const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppPadding.p10),
                child: NewestBookLoading(),
              ));
        }
        else if(state is SearchBooksErrorStates)
        {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else
        {
          return Container();
        }
      },
    );
  }
}