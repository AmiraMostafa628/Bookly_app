import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:bookly_app/features/home/presentaion/views_model/similar_books_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates>{
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitialStates());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category})async {
    emit(SimilarBooksLoadingStates());
    var result = await homeRepo.fetchSimilarBooks(category:category);

    result.fold((failure) {
      emit(SimilarBooksErrorStates(failure.errMessage));
    }, (books){
      emit(SimilarBooksSuccessStates(books));
    });

  }
}