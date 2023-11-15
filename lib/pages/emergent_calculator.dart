import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:flutter/material.dart';

class EmergentCalculatorPage extends StatefulWidget {
  const EmergentCalculatorPage({
    super.key,
  });

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
            TextFormField(
              controller: topController,
              onTap: topOnTapCallback,
              onChanged: (value) {},
            ),
            TextFormField(
              controller: bottomController,
              onTap: bottomOnTapCallback,
              onChanged: (value) {},
            ),
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
