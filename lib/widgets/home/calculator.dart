import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_input.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/utils/ve_to_us.dart';
import 'package:dolaraldia_argentina/widgets/home/add_button.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/clear_button.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calculator extends StatefulWidget {
  static const addButtonsValues = <String>[
    '1,00',
    '5,00',
    '10,00',
    '20,00',
    '50,00',
    '100,00',
  ];

  const Calculator({
    super.key,
    required this.rate,
  });

  final Rate rate;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final topApiFieldController = TextEditingController();
  final bottomApiFieldController = TextEditingController();

  final topCryptoFieldController = TextEditingController();
  final bottomCryptoFieldController = TextEditingController();

  void clearButtonCallback() {
    BlocProvider.of<LastInputCubit>(context).reset();

    topApiFieldController.clear();
    bottomApiFieldController.clear();

    topCryptoFieldController.clear();
    bottomCryptoFieldController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    topApiFieldController.dispose();
    bottomApiFieldController.dispose();

    topCryptoFieldController.dispose();
    bottomCryptoFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addButtons = [
      for (final value in Calculator.addButtonsValues)
        AddButton(
            value: value,
            onTapHandler: () {
              final text = topApiFieldController.text;
              final newValue = veToUsDecimal(value);

              if (text == '') {
                topApiFieldController.text = usToVeDecimal(newValue);
              } else {
                topApiFieldController.text =
                    usToVeDecimal(veToUsDecimal(text) + newValue);
              }
            }),
    ];

    final selectedControllers = switch (widget.rate) {
      Rate.petro || Rate.btc || Rate.eth => [
          topCryptoFieldController,
          bottomCryptoFieldController,
        ],
      _ => [
          topApiFieldController,
          bottomApiFieldController,
        ],
    };

    return Column(
      children: [
        InputField(
          inputType: Input.top,
          controller: selectedControllers[0],
        ),
        InputField(
          inputType: Input.bottom,
          controller: selectedControllers[1],
        ),
        Wrap(
          runSpacing: 10.0,
          children: addButtons,
        ),
        ClearButton(
          onPressedCallback: clearButtonCallback,
        ),
      ],
    );
  }
}
