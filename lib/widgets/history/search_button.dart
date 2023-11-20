import 'package:flutter/material.dart';

class HistorySearchButton extends StatelessWidget {
  const HistorySearchButton({
    super.key,
    required this.onPressedHandler,
  });

  final VoidCallback onPressedHandler;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressedHandler,
      child: const Text('BUSCAR'),
    );
  }
}