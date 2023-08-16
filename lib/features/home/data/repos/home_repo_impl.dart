import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{
  
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async{
   try{
   var data= await apiServices.getResponse(endPoint:
   'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
   List <BookModel> books=[];
   for(var element in data['items'])
     {
       try {
         books.add(BookModel.fromJson(element));
       } catch (e) {
         books.add(BookModel.fromJson(element));
       }
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
    try{
      var data = await apiServices.getResponse(endPoint:
      'volumes?Filtering=free-ebooks&q=programming');
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks
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