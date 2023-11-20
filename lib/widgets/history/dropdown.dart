import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
import 'package:flutter/material.dart';

class HistoryDropdown extends StatefulWidget {
  const HistoryDropdown({
    super.key,
    required this.dropdownValue,
    required this.onChangedCallback,
  });

  final HistoryRate dropdownValue;
  final Function(HistoryRate?) onChangedCallback;

  @override
  State<HistoryDropdown> createState() => _HistoryDropdownState();
}

class _HistoryDropdownState extends State<HistoryDropdown> {
  final rates = HistoryRate.values;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.dropdownValue,
      iconEnabledColor: Theme.of(context).colorScheme.onSurface,
      underline: Container(
        height: 2.0,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      items: [
        for (final label in rates)
          DropdownMenuItem(
            value: label,
            child: Text(label.name.capitalize()),
          ),
      ],
      onChanged: widget.onChangedCallback,
    );
  }
}
