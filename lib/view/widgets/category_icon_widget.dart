import 'package:flutter/material.dart';

class CategoryIconWidget extends StatelessWidget {
  final String icon;
  final Color color;

  const CategoryIconWidget({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: color.withAlpha(40),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Image.asset(
        'assets/icons/$icon.png',
        color: color,
        width: 32,
        height: 32,
      ),
    );
  }
}
