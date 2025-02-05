import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const CustomSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: SearchBar(
        controller: controller,
        elevation: const WidgetStatePropertyAll(0),
        hintText: "Search here",
        hintStyle: WidgetStatePropertyAll(
          textTheme(context).bodyMedium!.copyWith(
                color: colorScheme(context).outline,
              ),
        ),
        leading: const Icon(Icons.search),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(
            width: 1,
            color: colorScheme(context).onSurface.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
