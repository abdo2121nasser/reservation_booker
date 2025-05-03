import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/screens/specialist_detail_screen.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/time_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/values/app_size.dart';
import '../entities/specialist_entity.dart';

class TimeItemsListViewWidget extends StatefulWidget {
  final List<AvailableTimeEntity> availableTimes;
  const TimeItemsListViewWidget({super.key, required this.availableTimes});

  @override
  _TimeItemsListViewWidgetState createState() =>
      _TimeItemsListViewWidgetState();
}

class _TimeItemsListViewWidgetState extends State<TimeItemsListViewWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: k50V,
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
                  child:
                      TimeItemWidget(timeEntity: widget.availableTimes[index]),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: k10H,
                ),
            itemCount: widget.availableTimes.length
            // widget.availableDateEntity.length
            ),
      ),
    );
  }

  void _selectDate(int index, BuildContext context) {
    AvailableTimeEntity? previouslySelected;
    for (var element in widget.availableTimes) {
      if (element.isSelected) {
        previouslySelected = element;
        break;
      }
    }
    if (previouslySelected != null) {
      previouslySelected.isSelected = false;
    }
    setState(() {
      widget.availableTimes[index].isSelected = true;
      Provider.of<DateChangerNotifier>(context, listen: false)
          .selectTime(time: widget.availableTimes[index]);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
