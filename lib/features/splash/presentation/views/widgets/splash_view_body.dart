import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_provider.dart';
import 'animated_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlideAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsProvider.logo),
        const SizedBox(height: 4,),
        AnimatedText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 4),
          () {GoRouter.of(context).go(AppRouter.kHomeViewRoute);},
    );
  }

  void initSlideAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
