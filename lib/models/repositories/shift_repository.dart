class ShiftRepository {
  final Map<DateTime, List<String>> shiftEvents = {
    DateTime.utc(2023, 2, 20): ['firstEvent', 'secondEvent'],
    DateTime.utc(2023, 2, 5): ['thirdEvent', 'fourthEvent'],
  };

  Future<Map<DateTime, List<String>>> getShiftEvents() async {
    //TODO
    return shiftEvents;
  }
}
