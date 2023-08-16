
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/constants_manager.dart';
import 'package:bookly_app/core/utils/go_router.dart';
import 'package:bookly_app/core/utils/style_manager.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: AppSize.s125,
        child: Row(
          children: [
            CustomBookItem(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: AppSize.s30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child:  Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.testStyle20.copyWith(fontFamily: gtSectraFine),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s3,
                  ),
                  Text(bookModel.volumeInfo.authors![0],
                    style: Styles.testStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                  ),
                  const SizedBox(
                    height: AppSize.s3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Free',
                        style: Styles.testStyle20.copyWith(fontWeight: FontWeight.bold),
                      ),
                       BookRating(
                        rating: bookModel.volumeInfo.averageRating ?? 0,
                         count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

