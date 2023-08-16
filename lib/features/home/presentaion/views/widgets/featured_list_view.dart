import 'package:bookly_app/core/utils/go_router.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/skelton.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentaion/views_model/featured_books_cubit/cubit.dart';
import 'package:bookly_app/features/home/presentaion/views_model/featured_books_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksStates>(
      builder: (context,state){
        if(state is FeaturedBooksSuccessStates)
          {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics:const BouncingScrollPhysics(),
                  itemCount: state.books.length,
                  itemBuilder: (context,index)=>  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child:  GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.kBookDetailsView,
                            extra: state.books[index]);
                      },
                      child: CustomBookItem(imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail??'',),
                    ),
                  )),

            );
          }
        else if (state is FeaturedBooksErrorStates){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else
          {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics:const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context,index)=>  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child:  ImageLoading(),
                  )),

            );
          }
      },
    );
  }
}