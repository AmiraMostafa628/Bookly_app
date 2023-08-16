
import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class SimilarBooksStates{}

class SimilarBooksInitialStates extends SimilarBooksStates{}

class SimilarBooksLoadingStates extends SimilarBooksStates{}

class SimilarBooksSuccessStates extends SimilarBooksStates{
  final List <BookModel> books;

  SimilarBooksSuccessStates(this.books);

}

class SimilarBooksErrorStates extends SimilarBooksStates{
  final String errMessage;

  SimilarBooksErrorStates(this.errMessage);

}