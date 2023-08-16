import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class SearchBooksStates{}

class SearchBooksInitialStates extends SearchBooksStates{}

class SearchBooksLoadingStates extends SearchBooksStates{}

class SearchBooksSuccessStates extends SearchBooksStates{
  final List <BookModel> books;

  SearchBooksSuccessStates(this.books);

}

class SearchBooksErrorStates extends SearchBooksStates{
  final String errMessage;

  SearchBooksErrorStates(this.errMessage);

}