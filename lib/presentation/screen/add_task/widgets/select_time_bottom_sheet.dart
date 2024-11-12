import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/base_number_picker.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/cancel_button.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/save_button.dart';

class SelectTimeBottomSheet extends StatefulWidget {
  final DateTime initialSelectedTime;

  const SelectTimeBottomSheet({
    super.key,
    required this.initialSelectedTime,
  });

  @override
  State<SelectTimeBottomSheet> createState() => _SelectTimeBottomSheetState();
}

class _SelectTimeBottomSheetState extends State<SelectTimeBottomSheet> {
  late DateTime _selectedTime;
  int _selectedHour = 0;
  int _selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialSelectedTime;
    _selectedHour = _selectedTime.hour;
    _selectedMinute = _selectedTime.minute;
  }

  _updateSelectedTime() {
    setState(() {
      _selectedTime = DateTime(
        _selectedTime.year,
        _selectedTime.month,
        _selectedTime.day,
        _selectedHour,
        _selectedMinute,
        0,
      );
    });
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
              "Set Time",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseNumberPicker(
                  value: _selectedHour,
                  onChanged: (value) {
                    setState(() {
                      _selectedHour = value;
                      _updateSelectedTime();
                    });
                  },
                ),
                const SizedBox(width: 12),
                Text(
                  ":",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(width: 12),
                BaseNumberPicker(
                  value: _selectedMinute,
                  onChanged: (value) {
                    setState(() {
                      _selectedMinute = value;
                      _updateSelectedTime();
                    });
                  },
                ),
              ],
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
                  context.maybePop(_selectedTime);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
