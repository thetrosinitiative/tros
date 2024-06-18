import 'package:flutter/material.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/utils/constants/colors.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.width = 319,
    this.height = 61,
    this.radius = 20,
    required this.text,
    required this.onPressed,
  });
  final double width, height, radius;
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TRoundedContainer(
        width: width,
        height: height,
        radius: radius,
        gradient: PColors.buttonGradient,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: PColors.white),
        )),
      ),
    );
  }
}
