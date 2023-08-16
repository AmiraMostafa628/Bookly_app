import 'package:bookly_app/core/utils/constants_manager.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
  super.key,
  required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_){
        return SlideTransition(
          position: slidingAnimation,
          child: const Text("read free books",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: gtSectraFine,
              fontSize: 30
            ),
          ),
        );
      },
    );
  }
}