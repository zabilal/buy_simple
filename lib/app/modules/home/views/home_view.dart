import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/AnswerOption.dart';
import '../widgets/BottomNavItem.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.jpg',
            ), // You'll need to add this image
            fit: BoxFit.none,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Colors.transparent,
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
          // child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),
              // Status Bar and Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    // Stroll Bonfire Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(height: 30,),
                        Text(
                          'Stroll Bonfire',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFCCC8FF),
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white.withOpacity(0.8),
                          size: 24,
                        ),
                      ],
                    ),
                    // Timer and Participants
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.white.withOpacity(0.8),
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '22h 00m',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white.withOpacity(0.8),
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '103',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Spacer(),

              // Question Card
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0), // transparent
                      Colors.black.withOpacity(1.0), // fully opaque
                    ],
                    stops: [0.0, 0.2], // fade only at the top 20%
                  ),
                ),
                child: Column(
                  children: [
                    // User Profile
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: ClipOval(
                            child: Container(
                              width: 60,
                              height: 60,
                              color: Colors.green.withOpacity(0.7),
                              child: Image.asset(
                                'assets/profile.png',
                                // width: 60,
                                // height: 60,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Angelina, 28',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(height: 10),

                            // Question
                            Text(
                              'What is your favorite time\n of the day?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(height: 13),

                            // Quote
                            Text(
                              '"Mine is definitely the peace in the morning."',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    // Answer Options
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: AnswerOption(
                                  label: 'A',
                                  text: 'The peace in the early mornings',
                                  isSelected:
                                      controller.selectedOption.value == 'A',
                                  onTap: () => controller.selectOption('A'),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: AnswerOption(
                                  label: 'B',
                                  text: 'The magical golden hours',
                                  isSelected:
                                      controller.selectedOption.value == 'B',
                                  onTap: () => controller.selectOption('B'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: AnswerOption(
                                  label: 'C',
                                  text: 'Wind-down time after dinners',
                                  isSelected:
                                      controller.selectedOption.value == 'C',
                                  onTap: () => controller.selectOption('C'),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: AnswerOption(
                                  label: 'D',
                                  text: 'The serenity past midnight',
                                  isSelected:
                                      controller.selectedOption.value == 'D',
                                  onTap: () => controller.selectOption('D'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    // Instructions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pick your option.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'See who has a similar mind.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Microphone Button
                            Obx(
                              () => GestureDetector(
                                onTap: () => controller.toggleRecording(),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          controller.isRecording.value
                                              ? Colors.red
                                              : Color(0xFF8B88EF),
                                      width: 2,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Image.asset(
                                    'assets/mic.png',
                                    color:
                                        controller.isRecording.value
                                            ? Colors.red
                                            : Color(0xFF8B88EF),
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 5),

                            // Submit Button
                            Obx(
                              () => GestureDetector(
                                onTap:
                                    controller.selectedOption.value.isNotEmpty
                                        ? () => controller.submitAnswer()
                                        : null,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        controller
                                                .selectedOption
                                                .value
                                                .isNotEmpty
                                            ? Color(0xFF8B88EF)
                                            : Color(
                                              0xFF8B88EF,
                                            ).withOpacity(0.9),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ),
                      ],
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),

              // Bottom Navigation
              Container(
                decoration: BoxDecoration(color: Color(0xFF0F1115)),
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem(
                      icon: SvgPicture.asset('assets/card.svg'),
                      isActive: false,
                    ),
                    BottomNavItem(
                      icon: SvgPicture.asset('assets/bonfire.svg'),
                      badgeCount: 0,
                      isActive: false,
                    ),
                    BottomNavItem(
                      icon: SvgPicture.asset('assets/chatbubble.svg'),
                      badgeCount: 10,
                      isActive: false,
                    ),
                    BottomNavItem(
                      icon: SvgPicture.asset('assets/user.svg'),
                      isActive: false,
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 5),
            ],
          ),
          // ),
        ),
      ),
    );
  }
}
