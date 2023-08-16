import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:bookly_app/features/home/presentaion/views_model/featured_books_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>{
  FeaturedBooksCubit(this.homeRepo):super(FeaturedBooksInitialStates());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async {
    emit(FeaturedBooksLoadingStates());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((failure) {
      emit(FeaturedBooksErrorStates(failure.errMessage));
    }, (books){
      emit(FeaturedBooksSuccessStates(books));
    });

  }
}