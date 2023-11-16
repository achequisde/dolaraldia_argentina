import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/input_field.dart';
import 'package:flutter/material.dart';

class EmergentCalculatorPage extends StatefulWidget {
  const EmergentCalculatorPage({
    super.key,
    required this.rate,
  });

  final Rate rate;

  @override
  State<EmergentCalculatorPage> createState() => _EmergentCalculatorPageState();
}

class _EmergentCalculatorPageState extends State<EmergentCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    Input? lastInput;

    final topController = TextEditingController();
    final bottomController = TextEditingController();

    void topOnTapCallback() {
      if (lastInput == Input.bottom) {
        topController.clear();
        bottomController.clear();
      }

      lastInput = Input.top;
    }

    void bottomOnTapCallback() {
      if (lastInput == Input.top) {
        topController.clear();
        bottomController.clear();
      }

      lastInput = Input.bottom;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            InputField(
                inputType: Input.top,
                controller: topController,
                rate: widget.rate,
                isCryptoWithPetro: false,
                onTapCallback: onTapCallback,
                onChangedCallback: onChangedCallback),
            InputField(
                inputType: Input.bottom,
                controller: bottomController,
                rate: widget.rate,
                isCryptoWithPetro: false,
                onTapCallback: onTapCallback,
                onChangedCallback: onChangedCallback),
            FilledButton.tonal(
              onPressed: () {
                lastInput = null;

                topController.clear();
                bottomController.clear();
              },
              child: const Text('LIMPIAR'),
            )
          ],
        ),
      ),
    );
  }
}
