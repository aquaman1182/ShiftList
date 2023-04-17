import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/shift_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _focusedDay = DateTime.now();
    final _calendarFormat = CalendarFormat.month;
    final shiftViewModel = context.watch<ShiftViewModel>();
    final _selectedDay = ValueNotifier<DateTime?>(null);
    final _selectedEvents = ValueNotifier<List<String>>([]);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: _focusedDay,
              locale: 'ja_JP',
              eventLoader: (date) {
                return shiftViewModel.shiftEvents[date] ?? [];
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {},
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                _selectedDay.value = selectedDay;
                _selectedEvents.value = shiftViewModel.shiftEvents[selectedDay] ?? [];
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: _selectedEvents,
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final event = value[index];
                    return Card(
                      child: ListTile(
                        title: Text(event),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
