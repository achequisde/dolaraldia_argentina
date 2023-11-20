import 'dart:io';

import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/format_date_hour.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/utils/ve_to_us.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

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
    final screenshotController = ScreenshotController();

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

    final title = Text(
      'Dólar Al Día',
      style: Theme.of(context).textTheme.displaySmall,
    );
    final price = Text(
      'Bs. $historyPrice',
      style: Theme.of(context).textTheme.displaySmall,
    );

    final dataRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconLabel(
          icon: Icons.currency_exchange,
          text: rateName.capitalize(),
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

    VoidCallback screenshotButtonCallback(ScreenshotController controller,
        String date, String hour, String rateName) {
      return () async {
        await [Permission.storage].request();

        final directory = await getApplicationDocumentsDirectory();

        final image = await controller.capture(pixelRatio: 2.0);

        if (image == null) {
          return;
        }

        final formattedHour = formatHour(hour);

        final imageFile = File(
            '${directory.path}/DolarAlDia_${rateName}_${date}_$formattedHour.png');
        imageFile.writeAsBytes(image);
        final imageXFile = XFile(imageFile.path);

        await Share.shareXFiles(
          [imageXFile],
          // text:
          //     'Te comparto la tasa del ${selectedPrice < 3 ? 'Dólar ' : ' '}$monedaF en el día ${data.datePrice} a las ${data.hourPrice} a través de Dólar Al Día. Descarga la App: https://play.google.com/store/apps/details?id=com.corpotecguayana.dolaraldia',
        );

        if (imageFile.existsSync()) {
          await imageFile.delete();
        }
      };
    }

    final screenshotCallback = screenshotButtonCallback(
        screenshotController, widget.date, widget.hour, rateName);

    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: screenshotCallback,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/logo_dolar_al_dia.svg',
                  height: 120.0,
                  fit: BoxFit.contain,
                ),
                const Gap(10.0),
                title,
                const Gap(10.0),
                price,
                const Gap(20.0),
                dataRow,
                const Gap(30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: InputField(
                    inputType: Input.top,
                    controller: topController,
                    rate: Rate.values[widget.rate.index],
                    isCryptoWithPetro: false,
                    onTapCallback: topOnTapCallback,
                    onChangedCallback: topOnChangedCallback,
                  ),
                ),
                const Gap(20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: InputField(
                    inputType: Input.bottom,
                    controller: bottomController,
                    rate: Rate.values[widget.rate.index],
                    isCryptoWithPetro: false,
                    onTapCallback: bottomOnTapCallback,
                    onChangedCallback: bottomOnChangedCallback,
                  ),
                ),
                const Gap(40.0),
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
