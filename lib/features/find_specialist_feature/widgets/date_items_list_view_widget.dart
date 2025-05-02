import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

import '../../../core/utils/values/app_size.dart';
import 'date_item_widget.dart';

class DateItemsListViewWidget extends StatefulWidget {
  final List<AvailableDateEntity> availableDateEntity;
  const DateItemsListViewWidget({super.key, required this.availableDateEntity});

  @override
  State<DateItemsListViewWidget> createState() =>
      _DateItemsListViewWidgetState();
}

class _DateItemsListViewWidgetState extends State<DateItemsListViewWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: k16V, horizontal: k14H),
      child: SizedBox(
        height: k110V,
        child: Scrollbar(
          controller: _scrollController,
          radius: Radius.circular(k20R),
          interactive: true,
          thumbVisibility: true,
          thickness: k5V,
          child: ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: k14V),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => DateItemWidget(
                    dateTime: widget.availableDateEntity[index].date,
                isSelected: false,
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: k10H,
                  ),
              itemCount: widget.availableDateEntity.length),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
