import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../configs/configs.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              _buildAppBar(context),
              _buildBmiResult(context),
              _buildBmiEvaluation(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return MyAppBar(
      title: 'BMI Results',
      leftIcon: FontAwesomeIcons.angleLeft,
      leftIconOnPressed: () => Navigator.of(context).pop(),
      rightIcon: FontAwesomeIcons.user,
      rightIconOnPressed: () {},
    );
  }

  Widget _buildBmiResult(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: AppColors.neumorphicShadowLight,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: AppColors.neumorphicShadowDark,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Consumer(
          builder: (context, ref, _) {
            final bmi = ref.watch(bmiResultProvider);
            return SleekCircularSlider(
              min: 0,
              max: 50,
              initialValue: bmi,
              appearance: CircularSliderAppearance(
                startAngle: -90,
                angleRange: 360,
                size: 200,
                customColors: CustomSliderColors(
                  progressBarColor: AppColors.primary,
                  trackColor: AppColors.bmiTrackColor,
                ),
                customWidths: CustomSliderWidths(
                  progressBarWidth: 20,
                  trackWidth: 20,
                  handlerSize: 0,
                ),
              ),
              innerWidget: (value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMI',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        value.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 46),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildBmiEvaluation(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.6),
      child: Consumer(
        builder: (context, ref, _) {
          final evaluation = ref.watch(bmiEvaluationProvider);
          return Text(
            evaluation,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.grey,
                ),
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
