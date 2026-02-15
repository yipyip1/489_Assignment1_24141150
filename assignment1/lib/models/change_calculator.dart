import '../constants/app_constants.dart';

// handles the change calculation logic separately from ui
class ChangeCalculator {
  // takes an amount and returns how many of each note is needed
  static Map<int, int> calculate(int amount) {
    final Map<int, int> result = {};
    int remaining = amount;

    for (final int note in kNoteDenominations) {
      result[note] = remaining ~/ note;
      remaining = remaining % note;
    }

    return result;
  }
}
