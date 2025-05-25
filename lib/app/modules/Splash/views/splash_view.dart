import 'package:flutter/material.dart';

//
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import '../widgets/AnimatedPartice.dart';
//

class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A4C93),
              Color(0xFF8B5FBF),
              Color(0xFFA076C7),
              Color(0xFFB58BD1),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Animated background particles
            ...List.generate(20, (index) => AnimatedParticle(index: index)),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Logo
                  AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: controller.scaleAnimation.value,
                        child: Opacity(
                          opacity: controller.fadeAnimation.value,

                          child: Center(
                            child: Image.asset('assets/buysimple.png'),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40),

                  // Animated Title
                  AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, controller.slideAnimation.value),
                        child: Opacity(
                          opacity: controller.fadeAnimation.value,
                          child: Column(
                            children: [
                              Text(
                                'Buy Simple',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 60),

                  // Loading indicator
                  AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: controller.fadeAnimation.value,
                        child: Container(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
