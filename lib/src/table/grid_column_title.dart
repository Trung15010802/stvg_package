import 'package:flutter/material.dart';

class GridCollumTitle extends StatelessWidget {
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final String name;
  const GridCollumTitle({
    Key? key,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(8),
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      child: SelectableText(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
