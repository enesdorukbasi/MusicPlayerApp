import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingerTitle extends StatelessWidget {
  const SingerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Enes Dorukbaşı",
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
