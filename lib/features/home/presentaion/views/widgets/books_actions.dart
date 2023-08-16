import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/function/launch_url.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Row(
        children: [
          const Expanded(child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            text: 'Free',
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s16),
                bottomLeft: Radius.circular(AppSize.s16)
            ),
          )),
          Expanded(child: CustomButton(
            onPressed: () {
              launchCustomUrl(context,
                  bookModel.accessInfo?.webReaderLink);
            },
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            text: getText(bookModel),
            fontSize: AppSize.s16,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s16),
                bottomRight: Radius.circular(AppSize.s16)
            ),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel){
    if(bookModel.accessInfo?.webReaderLink == null)
      {
        return 'Not Available';
      }
    else {
      return 'Preview';
    }
  }
}