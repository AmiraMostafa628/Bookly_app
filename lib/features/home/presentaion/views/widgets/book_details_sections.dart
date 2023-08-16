import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/style_manager.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import 'book_rating.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width *.2),
          child: CustomBookItem(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',),
        ),
        const SizedBox(
          height: AppSize.s40,
        ),
         Text('${bookModel.volumeInfo.title}',
          style: Styles.testStyle30,
           textAlign: TextAlign.center,
           maxLines: 2,
           overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: AppSize.s6,
        ),
        Opacity(
          opacity: .7,
          child: Text(bookModel.volumeInfo.authors?[0] ?? '',
            textAlign: TextAlign.center,
            style: Styles.testStyle18.copyWith(
              fontStyle: FontStyle.italic,

            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
         BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: AppSize.s30,
        ),
         BooksAction(bookModel: bookModel,),
      ],
    );
  }
}