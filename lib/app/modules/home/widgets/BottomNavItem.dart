
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItem extends StatelessWidget {
  final dynamic icon;
  final bool isActive;
  final int? badgeCount;

  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.isActive,
    this.badgeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          child: icon is IconData
            ? Icon(
                icon,
                color: isActive ? Color(0xFF8B88EF) : Colors.white.withOpacity(0.6),
                size: 28,
              )
            : SizedBox(
                width: 44,
                height: 44,
                child: Center(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isActive ? Color(0xFF6F6E7C) : Colors.white.withOpacity(0.4),
                      BlendMode.srcIn,
                    ),
                    child: icon,
                  ),
                ),
              ),
        ),
        if (badgeCount != null)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xFF8B88EF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badgeCount.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}