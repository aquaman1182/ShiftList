import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/shift_view_model.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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

          return Card(
            child: ListTile(
              title: Text('${selectedDate.month}月${selectedDate.day}日'),
              subtitle: Text('時間を設定してください'),
              onTap: () async {
                DatePicker.showTimePicker(context,
                  showTitleActions: true,
                  showSecondsColumn: true,
                  onChanged: (date) {
                    print(date);
                  },
                  onConfirm: (date) {
                    print(date);
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.jp
                );

                // TimeOfDay? startTime = await showTimePicker(
                //   context: context,
                //   initialTime: TimeOfDay.now(),
                // );

                // if (startTime != null) {
                //   String startHourLabel =
                //       startTime.hour < 12 ? "午前" : "午後";

                //   TimeOfDay? endTime = await showTimePicker(
                //     context: context,
                //     initialTime: TimeOfDay.now(),
                //   );

                //   if (endTime != null) {
                //     String endHourLabel =
                //         endTime.hour < 12 ? "午前" : "午後";
                //     context.read<ShiftViewModel>().updateShift(
                //           selectedDate,
                //           '$startHourLabel ${startTime.hour}:${startTime.minute}',
                //           '$endHourLabel ${endTime.hour}:${endTime.minute}',
                //         );
                //   }
                // }
              },
            ),
          );
        },
      ),
    );
  }
}
