import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  final double height;

  const ChartContainer({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          'Chart Placeholder',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
