import 'package:bookly_app/core/utils/assets_manager.dart';
import 'package:bookly_app/core/utils/go_router.dart';
import 'package:bookly_app/features/splash/presentations/views/widgets/sliding_image.dart';
import 'package:bookly_app/features/splash/presentations/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin{
  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation ;

  late AnimationController animationControllerImage ;
  late Animation<Offset> slidingAnimationImage ;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initSlidingAnimationImage();
    
    navigateToHome();
  }

  

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    animationControllerImage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlidingImage(slidingAnimation: slidingAnimationImage),
          const SizedBox(height: 4,),
          SlidingText(slidingAnimation: slidingAnimation)
        ]);

  }

  void initSlidingAnimation() {
    animationController =AnimationController(vsync: this,
        duration: const Duration(seconds: 2));
    slidingAnimation = Tween<Offset>(begin:
    const Offset(-3,0),end:Offset.zero )
        .animate(animationController);
    animationController.forward();

  }

  void initSlidingAnimationImage()
  {
    animationControllerImage =AnimationController(vsync: this,
        duration: const Duration(seconds: 2));

    slidingAnimationImage = Tween<Offset>(begin:
    const Offset(3,0),end:Offset.zero )
        .animate(animationControllerImage);
    animationControllerImage.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5),(){
      /*Get.to(()=>const HomeView(),
      transition: Transition.fade,duration:kTransitionDuration );*/
      GoRouter.of(context).push(AppRouter.kHomeView,
      );
    });
  }
}


