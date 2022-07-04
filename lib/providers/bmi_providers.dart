import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';
import '../services/bmi_service.dart';
import 'bmi_state_notifier.dart';

final bmiServiceProvider = Provider<BmiService>((ref) => BmiService());

final bmiProvider = StateNotifierProvider<BmiStateNotifier, Bmi>((ref) => BmiStateNotifier());

final bmiResultProvider = StateProvider<double>((ref) => 0);

final bmiEvaluationProvider = Provider<String>((ref) {
  final bmiService = ref.watch(bmiServiceProvider);
  final bmi = ref.watch(bmiResultProvider);
  return bmiService.evaluate(bmi);
});
