import 'package:flutter/material.dart';

import '../../../core/utils/values/font_size.dart';

class SpecialistRateWidget extends StatelessWidget {
  final int rate;
  const SpecialistRateWidget({
    super.key,
    required this.rate
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return Icon(
          index < rate ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: k18Sp,
        );
      }),
    );
  }
}
