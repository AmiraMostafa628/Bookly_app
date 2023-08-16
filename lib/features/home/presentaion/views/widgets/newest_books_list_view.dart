import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/newest_book_loading.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/newest_books_List_view_item.dart';
import 'package:bookly_app/core/widgets/skelton.dart';
import 'package:bookly_app/features/home/presentaion/views_model/newest_books_cubit/cubit.dart';
import 'package:bookly_app/features/home/presentaion/views_model/newest_books_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksStates>(
      builder: (context,state){


        if(state is NewestBooksSuccessStates)
          {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)=> Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p10),
                child: BookListViewItem(bookModel:state.books[index]),),
              itemCount: state.books.length,
            );
          }
        else if(state is NewestBooksErrorStates)
          {
            return CustomErrorWidget(errMessage: state.errMessage);
          }
        else{
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
      },
    );
  }
}


