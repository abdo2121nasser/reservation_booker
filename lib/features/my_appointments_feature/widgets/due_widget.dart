import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import 'package:intl/intl.dart';

class DueWidget extends StatelessWidget {
  final DateTime date;
  const DueWidget({
    super.key,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: k14H,vertical: k10V),
      decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(k20R)),
      child: Text(
        _remainingTime(date),
        style: const TextStyle(color: kGreenColor),
      ),
    );
  }

  String _remainingTime(DateTime target) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final targetDate = DateTime(target.year, target.month, target.day);

    // If it’s today
    if (targetDate == today) {
      final diff = target.difference(now);
      final hours = diff.inHours;
      if (hours > 0) {
        return 'in $hours hour${hours > 1 ? 's' : ''}';
      }
      final minutes = diff.inMinutes;
      if (minutes > 0) {
        return 'in $minutes minute${minutes > 1 ? 's' : ''}';
      }
      return 'in a few seconds';
    }

    // If it’s tomorrow
    if (targetDate == tomorrow) {
      return 'tomorrow';
    }

    // If within a week
    final days = targetDate.difference(today).inDays;
    if (days < 7) {
      return 'in $days day${days > 1 ? 's' : ''}';
    }

    // If within a month
    if (days < 30) {
      final weeks = (days / 7).floor();
      return 'in $weeks week${weeks > 1 ? 's' : ''}';
    }

    // Else months
    final months = ((target.year - now.year) * 12 + target.month - now.month);
    return 'in $months month${months > 1 ? 's' : ''}';
  }

}
