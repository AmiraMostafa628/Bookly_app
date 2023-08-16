import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo{

  ApiServices apiServices;
  SearchRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks
      ({required String category}) async {
    try{
      var data = await apiServices.getResponse(endPoint:
      'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category');
      List <BookModel> books=[];
      for(var element in data['items'])
      {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    }
    catch(e){
      if(e is DioError)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}