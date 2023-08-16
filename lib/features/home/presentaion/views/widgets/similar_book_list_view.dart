import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/skelton.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentaion/views_model/similar_books_cubit/cubit.dart';
import 'package:bookly_app/features/home/presentaion/views_model/similar_books_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksStates>(
      builder: (context,state){
        if(state is SimilarBooksSuccessStates) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) =>  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
                      child: CustomBookItem(
                        imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??'',
                      ),
                    )),
          );
        }
        else if(state is SimilarBooksErrorStates)
          {
            return CustomErrorWidget(errMessage: state.errMessage,);
          }
        else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) =>  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
                  child: ImageLoading(),
                )),
          );
        }
      },
    );
  }
}