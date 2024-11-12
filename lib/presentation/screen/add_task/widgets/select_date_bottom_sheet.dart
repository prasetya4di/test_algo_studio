import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/cancel_button.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/save_button.dart';

class SelectDateBottomSheet extends StatefulWidget {
  final DateTime initialSelectedDate;

  const SelectDateBottomSheet({
    super.key,
    required this.initialSelectedDate,
  });

  @override
  State<SelectDateBottomSheet> createState() => _SelectDateBottomSheetState();
}

class _SelectDateBottomSheetState extends State<SelectDateBottomSheet> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialSelectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Set Date",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _selectedDate,
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
              headerStyle: HeaderStyle(
                titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                formatButtonVisible: false,
                titleCentered: true,
              ),
              daysOfWeekHeight: 12 * 1.5,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CancelButton(onPressed: () {
                  context.maybePop();
                }),
                const SizedBox(width: 12),
                SaveButton(onPressed: () {
                  context.maybePop(_selectedDate);
                  context.maybePop();
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}