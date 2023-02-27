import 'package:flutter/material.dart';

class ColorPickertItem extends StatelessWidget {
  const ColorPickertItem({
    super.key,
    required this.color,
    required this.isChecked,
  });

  final Color color;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      child: CircleAvatar(
        backgroundColor: color,
        child: isChecked ? const Icon(Icons.check) : null,
      ),
    );
  }
}
