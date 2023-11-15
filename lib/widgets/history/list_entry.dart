import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/models/history/history_entry.dart';
import 'package:dolaraldia_argentina/pages/emergent_calculator.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoryListEntry extends StatelessWidget {
  const HistoryListEntry({
    super.key,
    required this.data,
    required this.rate,
  });

  final HistoryEntry data;
  final HistoryRate rate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Bs. ${data.price}'),
      leading: Text(DateTime.parse(data.date).toVEDate()),
      trailing: FittedBox(
        child: Row(
          children: [
            Text(data.valuePercent),
            const Gap(20),
            IconButton(
              icon: Icon(
                Icons.calculate,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return EmergentCalculatorPage();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
