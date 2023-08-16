import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s16),
      child: AspectRatio(
        aspectRatio: 2.6/4,
        child:CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context,url,error)=>const Icon(Icons.error,color: Colors.red,),
        ),
      ),
    );
  }
}