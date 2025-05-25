import 'package:buy_simple/app/modules/home/views/home_view.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> slideAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: Duration(milliseconds: 2500),
      vsync: this,
    );

    //Fade animation for logo
    fadeAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.6, curve: Curves.easeOut),
      ),);

    //Scale Animation for logo
    scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.0, 0.8, curve: Curves.elasticOut),
        ));

    //Slide animation for text
    slideAnimation = Tween<double>(
        begin: 50.0,
        end: 0.0
    ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.4, 1.0, curve: Curves.easeOut),
        )
    );

    startAnimation();
  }

  void startAnimation() async {
    await animationController.forward();
    await Future.delayed(
        Duration(
            milliseconds: 800
        ));
    Get.off(() => HomeView(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 800)
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }



}
