import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftPage extends StatelessWidget {

  final DateTime _focusedDay = DateTime.now(); 
  final CalendarFormat _calendarFormat = CalendarFormat.month; 

  final sampleEvents = {
    DateTime.utc(2023, 2, 20): ['firstEvent', 'secondEvent'],
    DateTime.utc(2023, 2, 5): ['thirdEvent', 'fourthEvent']
  };

  @override
  Widget build(BuildContext context) {
    final _selectedDay = ValueNotifier<DateTime?>(null);
    final _selectedEvents = ValueNotifier<List<String>>([]);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: _focusedDay,
              eventLoader: (date) {
                return sampleEvents[date] ?? [];
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {},
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                _selectedDay.value = selectedDay;
                _selectedEvents.value = sampleEvents[selectedDay] ?? [];
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
