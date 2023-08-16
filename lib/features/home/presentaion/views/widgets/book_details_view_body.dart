import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/book_details_sections.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {

    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
            child: Column(
              children: [
                const CustomBookDetailsAppBarView(),
                BooksDetailsSection(bookModel: bookModel,),
                const Expanded(
                  child: SizedBox(
                    height: AppSize.s30,
                  ),
                ),
                const SimilarBooksSection(),
                 const SizedBox(
                  height: AppSize.s40,
                ),


              ],
            ),
          ),
        )
      ],
    );
  }
}









