import 'package:flutter_riverpod/flutter_riverpod.dart';

class EasterEggCounter extends Notifier<int> {
  @override
  int build() => 1;

  void increment() => state++;
}

final easterEggCounter = NotifierProvider<EasterEggCounter, int>(EasterEggCounter.new);
