import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/helpers/get_api_history_data.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/widgets/history/list_entry.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class History extends StatefulWidget {
  const History({
    super.key,
  });

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var currentDropdownValue = HistoryRate.bcv;

  var startDate = DateTime.now();
  var endDate = DateTime.now();

  var searchByRange = false;
  var showGraph = false;

  var entries = <Widget>[];

  void historySearchButtonCallback() async {
    final response = await getApiHistoryData(
      currentDropdownValue,
      startDate,
      searchByRange ? endDate : startDate,
    );

    if (response == null || response.priceDataHistory == null) {
      setState(() {
        entries = [
          const Center(
            child: Text('No se encontraron resultados.'),
          )
        ];
      });

      return;
    }

    final histories = [
      for (final dateGroup in response!.priceDataHistory!) dateGroup.priceData
    ];

    final widgets = [
      for (final entry in histories)
        for (final data in entry) HistoryListEntry(data: data, rate: currentDropdownValue,)
    ];

    setState(() {
      entries = widgets;
    });
  }

  void onDropdownChangeCallback(HistoryRate? newValue) {
    setState(() {
      currentDropdownValue = newValue!;
    });
  }

  void startDatePickerCallback(DateTime newDate) {
    setState(() {
      startDate = newDate;
    });
  }

  void endDatePickerCallback(DateTime newDate) {
    setState(() {
      endDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
              child: const Text(
                'Buscar\npor rango',
                textAlign: TextAlign.center,
              ),
            ),
            Switch.adaptive(
              value: searchByRange,
              onChanged: (bool newValue) {
                setState(() {
                  searchByRange = newValue;
                });
              },
            ),
            const Gap(10),
            HistoryDateField(
              date: startDate,
              onDatePickerCallback: startDatePickerCallback,
            ),
          ],
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: const Text(
                'Mostrar\ngráfica',
                textAlign: TextAlign.center,
              ),
            ),
            Switch.adaptive(
              value: showGraph,
              onChanged: (bool newValue) {
                setState(() {
                  showGraph = newValue;
                });
              },
            ),
            const Gap(10),
            HistoryDateField(
              date: endDate,
              onDatePickerCallback: endDatePickerCallback,
              enabled: searchByRange,
            ),
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tasa de Cambio: '),
            const Gap(20),
            HistoryDropdown(
              dropdownValue: currentDropdownValue,
              onChangedCallback: onDropdownChangeCallback,
            ),
          ],
        ),
        const Gap(10),
        HistorySearchButton(
          onPressedHandler: historySearchButtonCallback,
        ),
        const Gap(10),
        Expanded(
          child: HistoryEntries(entries: entries),
        ),
      ],
    );
  }
}

class HistoryDateField extends StatelessWidget {
  const HistoryDateField({
    super.key,
    required this.date,
    required this.onDatePickerCallback,
    this.enabled = true,
  });

  final DateTime date;
  final Function(DateTime) onDatePickerCallback;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: date.toVEDate());

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        enableInteractiveSelection: false,
        readOnly: true,
        textAlign: TextAlign.center,
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2021, 10, 18),
            lastDate: DateTime.now(),
            locale: const Locale('es', 'VE'),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            builder: (context, child) {
              return FittedBox(
                child: Theme(
                  data: ThemeData(
                    brightness: Theme.of(context).brightness,
                    colorScheme: Theme.of(context).colorScheme,
                    datePickerTheme: DatePickerThemeData(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      headerBackgroundColor:
                          Theme.of(context).colorScheme.background,
                      headerForegroundColor:
                          Theme.of(context).colorScheme.onSurface,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      elevation: 10.0,
                    ),
                  ),
                  child: child!,
                ),
              );
            },
          );

          if (picked != null) {
            onDatePickerCallback(picked);
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onSurface),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 1.0,
            ),
          ),
          labelText: 'Inicio',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelAlignment: FloatingLabelAlignment.center,
        ),
      ),
    );
  }
}

class HistorySearchButton extends StatelessWidget {
  const HistorySearchButton({
    super.key,
    required this.onPressedHandler,
  });

  final VoidCallback onPressedHandler;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressedHandler,
      child: const Text('BUSCAR'),
    );
  }
}

class HistoryEntries extends StatelessWidget {
  const HistoryEntries({
    super.key,
    required this.entries,
  });

  final List<Widget> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return entries[index];
      },
    );
  }
}

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
