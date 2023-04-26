import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/shift_view_model.dart';

class ShiftSettingPage extends StatelessWidget {
  final Set<DateTime> selectedDays;

  ShiftSettingPage({required this.selectedDays});

  @override
  Widget build(BuildContext context) {
    final ShiftViewModel shiftViewModel = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: Text('シフト設定'),
      ),
      body: ListView.builder(
        itemCount: shiftViewModel.selectedDays.length,
        itemBuilder: (context, index) {
          DateTime selectedDate = shiftViewModel.selectedDays.elementAt(index);
          TimeOfDay? startTime = shiftViewModel.getStartTime(selectedDate);
          TimeOfDay? endTime = shiftViewModel.getEndTime(selectedDate);

          String startTimeText = startTime != null
              ? '${startTime.hour < 12 ? "午前" : "午後"} ${startTime.hourOfPeriod.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}'
              : '開始時間を設定してください';

          String endTimeText = endTime != null
              ? '${endTime.hour < 12 ? "午前" : "午後"} ${endTime.hourOfPeriod.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}'
              : '終了時間を設定してください';

          return Card(
            child: ListTile(
              title: Text('${selectedDate.month}月${selectedDate.day}日'),
              subtitle: Text('$startTimeText - $endTimeText'),
              onTap: () async {
                DatePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  showSecondsColumn: false,
                  onChanged: (date) {
                    print(date);
                  },
                  onConfirm: (date) {
                    shiftViewModel.updateStartTime(
                        selectedDate, TimeOfDay(hour: date.hour, minute: date.minute));
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.jp,
                );

                DatePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  showSecondsColumn: false,
                  onChanged: (date) {
                    print(date);
                  },
                  onConfirm: (date) {
                    shiftViewModel.updateEndTime(
                        selectedDate, TimeOfDay(hour: date.hour, minute: date.minute));
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.jp,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
