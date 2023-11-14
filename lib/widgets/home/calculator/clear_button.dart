import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.onPressedCallback,
  });

  final void Function() onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressedCallback,
      child: const Text('LIMPIAR'),
    );
  }
}
