import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final void Function()? onTap;
  const CategoryWidget({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            category,
            style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
