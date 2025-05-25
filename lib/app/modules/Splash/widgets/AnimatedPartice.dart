
import 'package:flutter/material.dart';

class AnimatedParticle extends StatefulWidget {
  final int index;

  const AnimatedParticle({super.key, required this.index});

  @override
  _AnimatedParticleState createState() => _AnimatedParticleState();
}

class _AnimatedParticleState extends State<AnimatedParticle>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _startX;
  late double _startY;
  late double _size;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 3000 + (widget.index * 200)),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _startX = (widget.index % 5) * 80.0;
    _startY = (widget.index ~/ 5) * 120.0;
    _size = 4.0 + (widget.index % 3) * 2.0;

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          left: _startX + (_animation.value * 50),
          top: _startY + (_animation.value * 30),
          child: Opacity(
            opacity: 0.3 + (_animation.value * 0.4),
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}