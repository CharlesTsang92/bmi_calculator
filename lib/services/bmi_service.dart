class BmiService {
  String evaluate(double bmi) {
    if (bmi >= 25) {
      return 'You are overweight.\nTry to exercise more.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight.\nGood job!';
    } else {
      return 'You are underweight.\nTry to eat a bit more.';
    }
  }
}
