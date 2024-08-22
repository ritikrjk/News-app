import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.sunny,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme()),
          Icon(
            Icons.dark_mode_sharp,
            color: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
      ),
    );
  }
}
