
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/features/search/presention/view_model/cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text='';
    return  TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'Search',
          suffixIcon: IconButton(
              onPressed: ()async{
                if(text.isNotEmpty) {
                return await SearchBooksCubit.get(context)
                    .fetchSearchBooks(category: text);
              }
            }, icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: AppSize.s22,
            ),
          ) ),

      ),
      onFieldSubmitted: (value)async{
        if(value.isNotEmpty)
          {
            text=value;
            return await SearchBooksCubit.get(context)
                .fetchSearchBooks(category: value);
          }
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),

        borderSide: const BorderSide(
            color: Colors.white,

        )
    );
  }
}