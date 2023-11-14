import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_value.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_value.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/utils/ve_to_us.dart';
import 'package:dolaraldia_argentina/widgets/home/add_button.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/clear_button.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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

  void clearButtonCallback() {
    BlocProvider.of<LastCryptoInputCubit>(context).reset();
    BlocProvider.of<LastCryptoValueCubit>(context).reset();

    BlocProvider.of<LastApiInputCubit>(context).reset();
    BlocProvider.of<LastApiValueCubit>(context).reset();

    topApiFieldController.clear();
    bottomApiFieldController.clear();

    topCryptoFieldController.clear();
    bottomCryptoFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final isCrypto = switch (widget.rate) {
      Rate.petro || Rate.btc || Rate.eth => true,
      _ => false,
    };

    final data = getCurrentData(
        BlocProvider.of<ApiDataCubit>(context).state as ApiResponse,
        widget.rate);

    void updateCryptoValue() {
      final lastValue = BlocProvider.of<LastCryptoValueCubit>(context).state;

      if (lastValue != null) {
        final lastInput = BlocProvider.of<LastCryptoInputCubit>(context).state;

        final newValue = double.parse(lastValue) / 100;

        if (lastInput == Input.top) {
          bottomCryptoFieldController.text =
              usToVeDecimal(newValue * veToUsDecimal(data.price));
        } else if (lastInput == Input.bottom) {
          topCryptoFieldController.text =
              usToVeDecimal(newValue / veToUsDecimal(data.price));
        }
      }
    }

    void updateApiValue() {
      final lastValue = BlocProvider.of<LastApiValueCubit>(context).state;

      if (lastValue != null) {
        final lastInput = BlocProvider.of<LastApiInputCubit>(context).state;

        final newValue = double.parse(lastValue) / 100;

        if (lastInput == Input.top) {
          bottomApiFieldController.text =
              usToVeDecimal(newValue * veToUsDecimal(data.price));
        } else if (lastInput == Input.bottom) {
          topApiFieldController.text =
              usToVeDecimal(newValue / veToUsDecimal(data.price));
        }
      }
    }

    switch (isCrypto) {
      case true:
        updateCryptoValue();
        break;
      default:
        updateApiValue();
        break;
    }

    final addButtons = [
      for (final value in Calculator.addButtonsValues)
        AddButton(
          value: value,
          onTapHandler: () {
            final text = topApiFieldController.text;

            final newValue = veToUsDecimal(value);
            final oldValue = veToUsDecimal(text == '' ? '0' : text);

            final sum = oldValue + newValue;

            final sumWithoutPeriods = (sum * 10).toString().replaceAll('.', '');

            topApiFieldController.text = usToVeDecimal(sum);
            bottomApiFieldController.text =
                usToVeDecimal(sum * veToUsDecimal(data.price));

            BlocProvider.of<LastApiValueCubit>(context)
                .update(sumWithoutPeriods);
            BlocProvider.of<LastApiInputCubit>(context).setTop();
          },
        ),
    ];

    final selectedControllers = switch (isCrypto) {
      true => [
          topCryptoFieldController,
          bottomCryptoFieldController,
        ],
      false => [
          topApiFieldController,
          bottomApiFieldController,
        ],
    };

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InputField(
            inputType: Input.top,
            controller: selectedControllers[0],
            isCrypto: isCrypto,
            rate: widget.rate,
          ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InputField(
            inputType: Input.bottom,
            controller: selectedControllers[1],
            isCrypto: isCrypto,
            rate: widget.rate,
          ),
        ),
        const Gap(15),
        Visibility(
          visible: !isCrypto,
          child: Wrap(
            runSpacing: 10.0,
            children: addButtons,
          ),
        ),
        const Gap(10),
        ClearButton(
          onPressedCallback: clearButtonCallback,
        ),
      ],
    );
  }
}
