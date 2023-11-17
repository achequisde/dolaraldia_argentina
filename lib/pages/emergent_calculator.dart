import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/utils/ve_to_us.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EmergentCalculatorPage extends StatefulWidget {
  const EmergentCalculatorPage({
    super.key,
    required this.rate,
    required this.data,
  });

  final Rate rate;
  final String data;

  @override
  State<EmergentCalculatorPage> createState() => _EmergentCalculatorPageState();
}

class _EmergentCalculatorPageState extends State<EmergentCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    Input? lastInput;

    final data = widget.data;

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

    void topOnChangedCallback(String? value) {
      final n = (double.tryParse(value!) ?? 0) / 100;
      topController.text = usToVeDecimal(n);

      bottomController.text = usToVeDecimal(
        n * veToUsDecimal(data),
      );
    }

    void bottomOnChangedCallback(String? value) {
      final n = (double.tryParse(value!) ?? 0) / 100;
      bottomController.text = usToVeDecimal(n);

      topController.text = usToVeDecimal(
        n / veToUsDecimal(data),
      );
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
              onTapCallback: topOnTapCallback,
              onChangedCallback: topOnChangedCallback,
            ),
            const Gap(20),
            InputField(
              inputType: Input.bottom,
              controller: bottomController,
              rate: widget.rate,
              isCryptoWithPetro: false,
              onTapCallback: bottomOnTapCallback,
              onChangedCallback: bottomOnChangedCallback,
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
