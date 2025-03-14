import 'package:flutter/material.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NueBox extends StatelessWidget {
  final Widget? child;

  const NueBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
//is dark mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // darker on bottom right
            BoxShadow(
              color: isDarkMode ? Colors.black : Colors.grey.shade300,
              blurRadius: 15,
              offset: const Offset(4, 4),
            ),
            //lighter on top left
            BoxShadow(
              color: isDarkMode ? Colors.grey.shade800 : Colors.white,
              blurRadius: 15,
              offset: const Offset(-4, -4),
            ),
          ]),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
