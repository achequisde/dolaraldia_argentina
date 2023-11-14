import 'package:dolaraldia_argentina/providers/cubits/last_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
