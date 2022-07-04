import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../configs/configs.dart';
import '../providers/bmi_providers.dart';
import 'neumorphic_container.dart';

class HeightSlider extends ConsumerWidget {
  const HeightSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(bmiProvider.select((value) => value.height));
    return NeumorphicContainer(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(
            'Height',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.grey,
                ),
          ),
          const SizedBox(height: 30),
          Text(
            '${height.toStringAsFixed(0)} cm',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 36),
          ),
          Expanded(
            child: SfSlider.vertical(
              min: 120,
              max: 220,
              value: height,
              interval: 20,
              showTicks: true,
              showLabels: true,
              minorTicksPerInterval: 1,
              stepSize: 1,
              activeColor: AppColors.primary,
              inactiveColor: const Color(0xffd8dfe3),
              onChanged: (value) => ref.read(bmiProvider.notifier).changeHeight(value as double),
            ),
          ),
        ],
      ),
    );
  }
}
