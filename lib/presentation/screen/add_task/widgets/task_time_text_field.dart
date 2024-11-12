import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_algo_studio/presentation/screen/add_task/widgets/select_time_bottom_sheet.dart';

class TaskTimeTextField extends StatefulWidget {
  const TaskTimeTextField({super.key});

  @override
  State<StatefulWidget> createState() => _TaskTimeTextFieldState();
}

class _TaskTimeTextFieldState extends State<TaskTimeTextField> {
  bool _timeEnabled = false;
  DateTime _selectedTime =
      DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.timer_sharp),
                const SizedBox(width: 8),
                Text(
                  'Time',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            Switch(
              value: _timeEnabled,
              onChanged: (value) {
                setState(() {
                  _timeEnabled = value;
                });
              },
            ),
          ],
        ),
        if (_timeEnabled) ...[
          const SizedBox(height: 8),
          TextFormField(
            readOnly: true,
            controller: _controller,
            onTap: () {
              showModalBottomSheet(
                context: context,
                useSafeArea: true,
                useRootNavigator: true,
                isScrollControlled: true,
                showDragHandle: true,
                builder: (context) => SelectTimeBottomSheet(
                  initialSelectedTime: _selectedTime,
                ),
              ).then((value) {
                if (value != null) {
                  _selectedTime = value;
                  _controller.text =
                      DateFormat("HH:mm").format(_selectedTime);
                }
              });
            },
            onSaved: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select correct time';
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.timer_sharp),
              hintText: "Select Time",
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ]
      ],
    );
  }
}
