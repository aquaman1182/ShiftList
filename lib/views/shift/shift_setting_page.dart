import 'package:flutter/material.dart';
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
          return ListTile(
            title: Text('${selectedDate.year}-${selectedDate.month}-${selectedDate.day}'),
            // 時間を設定できるようにする部分は、ここに追加してください。
          );
        },
      ),
    );
  }
}
