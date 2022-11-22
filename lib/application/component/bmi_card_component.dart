import 'package:flutter/material.dart';

import '../contants/constants.dart';

class BmiCardComponent extends StatelessWidget {
  const BmiCardComponent({
    Key? key,
    this.child,
    this.borderColor = Colors.white10,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Constants.spacing4),
        border: Border.all(
          color: borderColor!,
        ),
      ),
      margin: const EdgeInsets.all(Constants.spacing4),
      child: child,
    );
  }
}
