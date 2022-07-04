import 'dart:math';

import 'package:flutter/foundation.dart';

enum Gender {
  male,
  female,
}

@immutable
class Bmi {
  const Bmi({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  final Gender gender;
  final double height;
  final double weight;
  final int age;

  factory Bmi.initial() {
    return const Bmi(
        gender: Gender.male,
        height: 180,
        weight: 70,
        age: 30,
      );
  }

  Bmi copyWith({
    Gender? gender,
    double? height,
    double? weight,
    int? age,
  }) {
    return Bmi(
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }

  @override
  String toString() => 'Bmi(gender: $gender, height: $height, weight: $weight, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bmi &&
        other.gender == gender &&
        other.height == height &&
        other.weight == weight &&
        other.age == age;
  }

  @override
  int get hashCode => gender.hashCode ^ height.hashCode ^ weight.hashCode ^ age.hashCode;

  double calculate() => weight / pow(height / 100, 2);
}
