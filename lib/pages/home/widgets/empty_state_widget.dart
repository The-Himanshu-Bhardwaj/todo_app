import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../util/strings.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(NO_DATA_ANIM, repeat: false, frameRate: const FrameRate(60)),
        const Text('Add a note to get started')
      ],
    );
  }
}
