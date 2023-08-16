import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class FeaturedBooksStates{}

class FeaturedBooksInitialStates extends FeaturedBooksStates{}

class FeaturedBooksLoadingStates extends FeaturedBooksStates{}

class FeaturedBooksSuccessStates extends FeaturedBooksStates{
 final List <BookModel> books;

  FeaturedBooksSuccessStates(this.books);

}

class FeaturedBooksErrorStates extends FeaturedBooksStates{
  final String errMessage;

   FeaturedBooksErrorStates(this.errMessage);

}