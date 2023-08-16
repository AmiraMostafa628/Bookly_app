import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:bookly_app/features/home/presentaion/views_model/newest_books_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates>{
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitialStates());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks()async {
    emit(NewestBooksLoadingStates());
    var result = await homeRepo.fetchNewestBooks();

    result.fold((failure) {
      emit(NewestBooksErrorStates(failure.errMessage));
    }, (books){
      emit(NewestBooksSuccessStates(books));
    });

  }
}