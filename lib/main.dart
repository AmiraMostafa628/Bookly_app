
import 'package:bookly_app/core/utils/constants_manager.dart';
import 'package:bookly_app/core/utils/di.dart';
import 'package:bookly_app/core/utils/go_router.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentaion/views_model/featured_books_cubit/cubit.dart';
import 'package:bookly_app/features/home/presentaion/views_model/newest_books_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  initAppModule();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:  [
        BlocProvider(create: (context)=>FeaturedBooksCubit(
            instance.get<HomeRepoImpl>())..fetchFeaturedBooks(),),
        BlocProvider(create: (context)=>NewestBooksCubit(
            instance.get<HomeRepoImpl>())..fetchNewestBooks(),),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),
      ),
    );
  }
}
