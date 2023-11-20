import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_current_crypto_data.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/models/api/rate_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/crypto_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_value.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_value.dart';
import 'package:dolaraldia_argentina/utils/crypto_to_us.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/utils/ve_to_us.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/add_button.dart';
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
    final isCryptoWithPetro = switch (widget.rate) {
      Rate.petro || Rate.btc || Rate.eth => true,
      _ => false,
    };

    final isCrypto = switch (widget.rate) {
      Rate.btc || Rate.eth || Rate.usdt => true,
      _ => false,
    };

    late final RateData currentData;

    if (isCrypto) {
      final data = BlocProvider.of<CryptoDataCubit>(context).state;
      currentData = RateData.fromCryptoRateData(
          getCurrentCryptoData(data, widget.rate), data.timestamp);
    } else {
      final data = BlocProvider.of<ApiDataCubit>(context).state as ApiResponse;
      currentData = getCurrentData(data, widget.rate);
    }

    void updateCryptoLastValue() {
      final lastValue = BlocProvider.of<LastCryptoValueCubit>(context).state;

      if (lastValue != null) {
        final lastInput = BlocProvider.of<LastCryptoInputCubit>(context).state;

        if (lastInput == Input.top) {
          final newValue = double.parse(lastValue) / 10e5;
          bottomCryptoFieldController.text =
              usToVeDecimal(newValue * veToUsDecimal(currentData.price));
        } else if (lastInput == Input.bottom) {
          final newValue = double.parse(lastValue) / 100;
          topCryptoFieldController.text =
              cryptoToUsDecimal(newValue / veToUsDecimal(currentData.price));
        }
      }
    }

    void updateApiLastValue() {
      final lastValue = BlocProvider.of<LastApiValueCubit>(context).state;

      if (lastValue != null) {
        final lastInput = BlocProvider.of<LastApiInputCubit>(context).state;

        final newValue = double.parse(lastValue) / 100;

        if (lastInput == Input.top) {
          bottomApiFieldController.text =
              usToVeDecimal(newValue * veToUsDecimal(currentData.price));
        } else if (lastInput == Input.bottom) {
          topApiFieldController.text =
              usToVeDecimal(newValue / veToUsDecimal(currentData.price));
        }
      }
    }

    switch (isCryptoWithPetro) {
      case true:
        updateCryptoLastValue();
        break;
      default:
        updateApiLastValue();
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
                usToVeDecimal(sum * veToUsDecimal(currentData.price));

            BlocProvider.of<LastApiValueCubit>(context)
                .update(sumWithoutPeriods);
            BlocProvider.of<LastApiInputCubit>(context).setTop();
          },
        ),
    ];

    final selectedControllers = switch (isCryptoWithPetro) {
      true => [
          topCryptoFieldController,
          bottomCryptoFieldController,
        ],
      false => [
          topApiFieldController,
          bottomApiFieldController,
        ],
    };

    void onTopFieldTapCallback() {
      if (isCryptoWithPetro) {
        final lastCryptoInput =
            BlocProvider.of<LastCryptoInputCubit>(context).state;

        if (lastCryptoInput == Input.bottom) {
          selectedControllers[0].clear();
          selectedControllers[1].clear();
        }

        BlocProvider.of<LastCryptoInputCubit>(context).setTop();
      } else {
        final lastCryptoInput =
            BlocProvider.of<LastApiInputCubit>(context).state;

        if (lastCryptoInput == Input.bottom) {
          selectedControllers[0].clear();
          selectedControllers[1].clear();
        }

        BlocProvider.of<LastApiInputCubit>(context).setTop();
      }

      selectedControllers[0].selection = TextSelection.fromPosition(
        TextPosition(
          offset: selectedControllers[0].text.length,
        ),
      );
    }

    void onBottomFieldTapCallback() {
      if (isCryptoWithPetro) {
        final lastCryptoInput =
            BlocProvider.of<LastCryptoInputCubit>(context).state;

        if (lastCryptoInput == Input.top) {
          selectedControllers[0].clear();
          selectedControllers[1].clear();
        }

        BlocProvider.of<LastCryptoInputCubit>(context).setBottom();
      } else {
        final lastCryptoInput =
            BlocProvider.of<LastApiInputCubit>(context).state;

        if (lastCryptoInput == Input.top) {
          selectedControllers[0].clear();
          selectedControllers[1].clear();
        }

        BlocProvider.of<LastApiInputCubit>(context).setBottom();
      }

      selectedControllers[1].selection = TextSelection.fromPosition(
        TextPosition(
          offset: selectedControllers[1].text.length,
        ),
      );
    }

    void onTopFieldChangedCallback(String? value) {
      if (isCryptoWithPetro) {
        BlocProvider.of<LastCryptoValueCubit>(context).update(value!);
      } else {
        BlocProvider.of<LastApiValueCubit>(context).update(value!);
      }

      late final double n;

      if (isCryptoWithPetro) {
        n = (double.tryParse(value) ?? 0) / 10e5;
        selectedControllers[0].text = cryptoToUsDecimal(n);
      } else {
        n = (double.tryParse(value) ?? 0) / 100;
        selectedControllers[0].text = usToVeDecimal(n);
      }

      selectedControllers[1].text = usToVeDecimal(
        n * veToUsDecimal(currentData.price),
      );
    }

    void onBottomFieldChangedCallback(String? value) {
      if (isCryptoWithPetro) {
        BlocProvider.of<LastCryptoValueCubit>(context).update(value!);
      } else {
        BlocProvider.of<LastApiValueCubit>(context).update(value!);
      }

      final n = (double.tryParse(value) ?? 0) / 100;
      selectedControllers[1].text = usToVeDecimal(n);

      if (isCryptoWithPetro) {
        selectedControllers[0].text = cryptoToUsDecimal(
          n / veToUsDecimal(currentData.price),
        );
      } else {
        selectedControllers[0].text = usToVeDecimal(
          n / veToUsDecimal(currentData.price),
        );
      }
    }

    return Column(
      children: [
        InputField(
          inputType: Input.top,
          controller: selectedControllers[0],
          isCryptoWithPetro: isCryptoWithPetro,
          onTapCallback: onTopFieldTapCallback,
          onChangedCallback: onTopFieldChangedCallback,
          rate: widget.rate,
        ),
        const Gap(20),
        InputField(
          inputType: Input.bottom,
          controller: selectedControllers[1],
          isCryptoWithPetro: isCryptoWithPetro,
          onTapCallback: onBottomFieldTapCallback,
          onChangedCallback: onBottomFieldChangedCallback,
          rate: widget.rate,
        ),
        const Gap(15),
        Visibility(
          visible: !isCryptoWithPetro,
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            spacing: 5.0,
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
