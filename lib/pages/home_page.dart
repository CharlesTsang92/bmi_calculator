import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../configs/configs.dart';
import '../models/models.dart';
import '../providers/bmi_providers.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(height: 24),
              _buildGenderButtons(),
              const SizedBox(height: 24),
              _buildInputSection(),
              const SizedBox(height: 24),
              _buildCalculateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return MyAppBar(
      title: 'BMI Calculator',
      leftIcon: FontAwesomeIcons.bars,
      leftIconOnPressed: () {},
      rightIcon: FontAwesomeIcons.user,
      rightIconOnPressed: () {},
    );
  }

  Widget _buildGenderButtons() {
    return Consumer(
      builder: (context, ref, _) {
        return SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: NeumorphicRadioButton<Gender>(
                  icon: FontAwesomeIcons.mars,
                  value: Gender.male,
                  groupValue: ref.watch(bmiProvider.select((value) => value.gender)),
                  activeColor: Colors.blue,
                  onPressed: (gender) => ref.read(bmiProvider.notifier).changeGender(gender),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: NeumorphicRadioButton<Gender>(
                  icon: FontAwesomeIcons.venus,
                  value: Gender.female,
                  groupValue: ref.watch(bmiProvider.select((value) => value.gender)),
                  activeColor: Colors.red,
                  onPressed: (gender) => ref.read(bmiProvider.notifier).changeGender(gender),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputSection() {
    return SizedBox(
      height: 450,
      child: Row(
        children: [
          const Expanded(
            child: HeightSlider(),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final weight = ref.watch(bmiProvider.select((value) => value.weight));
                      return NumberInputCard(
                        label: 'Weight',
                        value: weight.toStringAsFixed(0),
                        unit: 'kg',
                        maxValueValidation: () => weight < 300,
                        minValueValidation: () => weight > 0,
                        onAddButtonPressed: () => ref.read(bmiProvider.notifier).changeWeight(weight + 1),
                        onMinusButtonPressed: () => ref.read(bmiProvider.notifier).changeWeight(weight - 1),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final age = ref.watch(bmiProvider.select((value) => value.age));
                      return NumberInputCard(
                        label: 'Age',
                        value: '$age',
                        maxValueValidation: () => age < 120,
                        minValueValidation: () => age > 0,
                        onAddButtonPressed: () => ref.read(bmiProvider.notifier).changeAge(age + 1),
                        onMinusButtonPressed: () => ref.read(bmiProvider.notifier).changeAge(age - 1),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildCalculateButton(BuildContext context) {
    return Expanded(
      child: Consumer(builder: (context, ref, _) {
        return NeumorphicButton(
          onPressed: () {
            ref.read(bmiResultProvider.notifier).state = ref.read(bmiProvider.notifier).calculate();
            Navigator.of(context).pushNamed(AppRoutes.result);
          },
          child: Text(
            'Calculate',
            style: Theme.of(context).primaryTextTheme.titleLarge,
          ),
        );
      }),
    );
  }
}
