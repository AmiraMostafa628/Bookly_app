import 'package:bookly_app/core/utils/assets_manager.dart';
import 'package:bookly_app/core/utils/go_router.dart';
import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Row(
        children: [
          Image.asset(
            AssetsManager.logo,
            height: 18,
          ),
          const Spacer(),
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.kSearchView);
          }, icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: AppSize.s22,
          ) )
        ],

      ),
    );
  }
}