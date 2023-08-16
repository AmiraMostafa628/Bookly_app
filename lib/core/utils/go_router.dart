import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/di.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentaion/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/home/presentaion/views_model/similar_books_cubit/cubit.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/features/search/presention/view/search_view.dart';
import 'package:bookly_app/features/search/presention/view_model/cubit.dart';
import 'package:bookly_app/features/splash/presentations/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final  router = GoRouter(
    routes:[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create:(context)=>
                  SimilarBooksCubit(instance.get<HomeRepoImpl>()),
            child:  BookDetailsView(bookModel: state.extra as BookModel,),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context)=>
                SearchBooksCubit(instance.get<SearchRepoImpl>()),
              child:  const SearchView());
        },
      ),
    ],
  );
}