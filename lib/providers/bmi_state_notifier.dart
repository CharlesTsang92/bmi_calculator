import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class BmiStateNotifier extends StateNotifier<Bmi> {
  BmiStateNotifier() : super(Bmi.initial());

  void changeGender(Gender gender) => state = state.copyWith(gender: gender);

  void changeHeight(double height) => state = state.copyWith(height: height);

  void changeWeight(double weight) => state = state.copyWith(weight: weight);

  void changeAge(int age) => state = state.copyWith(age: age);

  double calculate() => state.calculate();
}
