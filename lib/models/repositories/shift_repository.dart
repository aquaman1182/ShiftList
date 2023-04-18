import 'package:shift_app/models/db/database_manager.dart';

class ShiftRepository {
  final DatabaseManager databaseManager;

  ShiftRepository({required DatabaseManager databaseManager})
      : databaseManager = databaseManager;

  final Map<DateTime, List<String>> shiftEvents = {
    DateTime.utc(2023, 2, 20): ['firstEvent', 'secondEvent'],
    DateTime.utc(2023, 2, 5): ['thirdEvent', 'fourthEvent'],
  };

  Future<void> logout() async {
    await databaseManager.logout();
  }

  Future<Map<DateTime, List<String>>> getShiftEvents() async {
    //TODO
    return shiftEvents;
  }
}
