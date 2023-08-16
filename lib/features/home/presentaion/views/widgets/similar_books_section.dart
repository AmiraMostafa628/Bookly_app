import 'package:bookly_app/core/utils/style_manager.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text('You can also like',
            style: Styles.testStyle14.copyWith(
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s16,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}