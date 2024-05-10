import 'package:flutter/material.dart';

final class CustomFormSheet extends StatelessWidget {
  const CustomFormSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CustomFormSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Please read this form ' * 20),
        IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(
            Icons.check_box_outlined,
          ),
        )
      ],
    );
  }
}
