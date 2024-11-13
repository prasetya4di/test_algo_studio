import 'package:flutter/material.dart';

class AnimatedCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AnimatedCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<AnimatedCheckbox> createState() => _AnimatedCheckboxState();
}

class _AnimatedCheckboxState extends State<AnimatedCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.value) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        widget.onChanged(!widget.value);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * 0.2,
            child: Checkbox(
              value: widget.value,
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}