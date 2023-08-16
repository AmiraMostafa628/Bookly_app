import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:  const EdgeInsets.all(AppPadding.p16 / 2),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.06),
          borderRadius:
          const BorderRadius.all(Radius.circular(AppPadding.p16))),
      child: const AspectRatio(
        aspectRatio: 2.6/4,
      ),
    );

  }
}

class TextLoading extends StatelessWidget {
   const TextLoading({Key? key,required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: 20,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16 / 2),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.06),
            borderRadius:
            const BorderRadius.all(Radius.circular(AppPadding.p16))),
      ),
    );

  }
}

class CircleLoading extends StatelessWidget {
  const CircleLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * .1,
      height: 25,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16 / 2),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.06),
          shape: BoxShape.circle,
        ),
      ),
    );

  }
}



