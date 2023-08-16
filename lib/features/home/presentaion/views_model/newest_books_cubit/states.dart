import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class NewestBooksStates{}

class NewestBooksInitialStates extends NewestBooksStates{}

class NewestBooksLoadingStates extends NewestBooksStates{}

class NewestBooksSuccessStates extends NewestBooksStates{
  final List <BookModel> books;

  NewestBooksSuccessStates(this.books);

}

class NewestBooksErrorStates extends NewestBooksStates{
  final String errMessage;

  NewestBooksErrorStates(this.errMessage);

}