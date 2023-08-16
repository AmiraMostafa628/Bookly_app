import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:bookly_app/core/widgets/skelton.dart';
import 'package:flutter/material.dart';

class NewestBookLoading extends StatelessWidget {
  const NewestBookLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SizedBox(
      height: AppSize.s125,
      child: Row(
        children: [
          ImageLoading(),
          SizedBox(
            width: AppSize.s30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s10,
                ),
                TextLoading(width: .5,),
                SizedBox(
                  height: AppSize.s10,
                ),
                TextLoading(width: .3,),
                SizedBox(
                  height: AppSize.s15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextLoading(width: .25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleLoading(),
                        TextLoading(width: .15,),
                      ],
                    ),

                  ],
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}