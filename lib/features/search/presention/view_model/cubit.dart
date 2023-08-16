import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:bookly_app/features/search/presention/view_model/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates>{
  SearchBooksCubit(this.searchRepo):super(SearchBooksInitialStates());

  final SearchRepo searchRepo;

  static SearchBooksCubit get(context) => BlocProvider.of(context);



  Future<void> fetchSearchBooks({required String category})async {
    emit(SearchBooksLoadingStates());
    var result = await searchRepo.fetchSearchBooks(category:category);

    result.fold((failure) {
      emit(SearchBooksErrorStates(failure.errMessage));
    }, (books){
      emit(SearchBooksSuccessStates(books));
    });

  }
}