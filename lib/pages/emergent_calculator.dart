import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
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
    required this.historyPrice,
    required this.date,
    required this.hour,
  });

  final HistoryRate rate;
  final String historyPrice;
  final String date;
  final String hour;

  @override
  State<EmergentCalculatorPage> createState() => _EmergentCalculatorPageState();
}

class _EmergentCalculatorPageState extends State<EmergentCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    Input? lastInput;

    final rateName = widget.rate.name;
    final historyPrice = widget.historyPrice;

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
        n * veToUsDecimal(historyPrice),
      );
    }

    void bottomOnChangedCallback(String? value) {
      final n = (double.tryParse(value!) ?? 0) / 100;
      bottomController.text = usToVeDecimal(n);

      topController.text = usToVeDecimal(
        n / veToUsDecimal(historyPrice),
      );
    }

    const title = Text('Dólar Al Día');
    final price = Text('Bs. $historyPrice');

    final dataRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconLabel(
          icon: Icons.currency_exchange,
          text: rateName,
        ),
        IconLabel(
          icon: Icons.calendar_today,
          text: DateTime.parse(widget.date).toVEDate(),
        ),
        IconLabel(
          icon: Icons.watch_later_outlined,
          text: widget.hour,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            title,
            price,
            dataRow,
            InputField(
              inputType: Input.top,
              controller: topController,
              rate: Rate.values[widget.rate.index],
              isCryptoWithPetro: false,
              onTapCallback: topOnTapCallback,
              onChangedCallback: topOnChangedCallback,
            ),
            const Gap(20),
            InputField(
              inputType: Input.bottom,
              controller: bottomController,
              rate: Rate.values[widget.rate.index],
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

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const Gap(8.0),
        Text(text),
      ],
    );
  }
}
