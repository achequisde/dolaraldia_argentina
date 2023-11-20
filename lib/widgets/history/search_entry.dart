import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/models/history/history_entry.dart';
import 'package:dolaraldia_argentina/pages/emergent_calculator.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistorySearchEntry extends StatelessWidget {
  const HistorySearchEntry({
    super.key,
    required this.data,
    required this.rate,
  });

  final HistoryEntry data;
  final HistoryRate rate;

  @override
  Widget build(BuildContext context) {
    final hour = Text(
      data.hour,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.normal,
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );

    final price = Text(
      'Bs. ${data.price}',
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.normal,
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );

    final icon = switch (data.valuePercent[0]) {
      '+' => Icons.arrow_upward,
      '-' => Icons.arrow_downward,
      _ => Icons.drag_handle,
    };

    final color = switch (data.valuePercent[0]) {
      '+' => const Color.fromRGBO(0, 157, 112, 1.0),
      '-' => Colors.red,
      _ => Colors.grey,
    };

    final percent = Row(
      children: [
        Icon(icon, color: color, size: 15.0),
        Text(
          data.valuePercent,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.normal,
                color: color,
              ),
        ),
      ],
    );

    final emergentCalculatorButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return EmergentCalculatorPage(
                rate: rate,
                historyPrice: data.price,
                date: data.date,
                hour: data.hour,
              );
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Icon(
        Icons.calculate_outlined,
        color: Theme.of(context).colorScheme.onSecondary,
        size: 32.0,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        hour,
        price,
        percent,
        emergentCalculatorButton,
      ],
    );
  }
}
