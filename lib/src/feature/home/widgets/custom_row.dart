import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRow extends StatelessWidget {
  String? text1;
  VoidCallback onTap;

  CustomRow({super.key, required this.text1, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1!,
          style: textTheme(context)
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            "View All",
            style: textTheme(context).labelSmall?.copyWith(
                  color: colorScheme(context).primary,
                  decoration: TextDecoration.underline,
                  decorationColor: colorScheme(context).primary,
                ),
          ),
        )
      ],
    );
  }
}
