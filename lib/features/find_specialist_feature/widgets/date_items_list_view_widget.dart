import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:provider/provider.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_detail_screen_body_widget.dart';

import '../../../core/utils/values/app_size.dart';
import '../screens/specialist_detail_screen.dart';
import 'date_item_widget.dart';

class DateItemsListViewWidget extends StatefulWidget {
  final List<AvailableDateEntity> availableDateEntity;
  const DateItemsListViewWidget({
    super.key,
    required this.availableDateEntity,
  });

  @override
  State<DateItemsListViewWidget> createState() =>
      _DateItemsListViewWidgetState();
}

class _DateItemsListViewWidgetState extends State<DateItemsListViewWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    _selectDate(index, context);
                  },
                  child: DateItemWidget(
                    dateTime: widget.availableDateEntity[index].date,
                    isSelected: widget.availableDateEntity[index].isSelected,
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: k10H,
                ),
            itemCount: widget.availableDateEntity.length),
      ),
    );
  }

  void _selectDate(int index, BuildContext context) {
    AvailableDateEntity? previouslySelected;
    for (var element in widget.availableDateEntity) {
      if (element.isSelected) {
        previouslySelected = element;
        break;
      }
    }
    if (previouslySelected != null) {
      previouslySelected.isSelected = false;
    }
    setState(() {
      widget.availableDateEntity[index].isSelected = true;
      Provider.of<DateChangerNotifier>(context, listen: false)
          .selectDate(date: widget.availableDateEntity[index]);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
