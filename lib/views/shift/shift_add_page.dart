import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/shift_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftAddPage extends StatelessWidget {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
final ShiftViewModel shiftViewModel = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: Text("Shift追加"),
      ),
      body: Column(
          children: [
            TableCalendar(
              //カレンダー日本語化
              locale: 'ja_JP',
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              //カレンダーの日付をタップしたときに、その日付をfocusedDayにセットする
              focusedDay: shiftViewModel.focusedDay,
              //
              eventLoader: (date) {
                return shiftViewModel.shiftRepository.shiftEvents[date] ?? [];
              },
              //月を変えたときに、focusedDayを更新する
              onPageChanged: (focusedDay) {
                shiftViewModel.updateFocusedDay(focusedDay);
              },
              //カレンダーの表示形式
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                //TODO カレンダーの表示形式を変えたときの処理
              },
              //カレンダーの日付の装飾
              calendarBuilders: CalendarBuilders(
                dowBuilder: (_, day) {
                  if(day.weekday == DateTime.sunday) {
                    return Center(
                      child: Text(
                        "日",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  //問題なければnullを返す
                  return null;
                },
                //選択した日付の装飾
                selectedBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                //今日の日付の装飾
                todayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }
}