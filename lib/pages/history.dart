import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/helpers/get_api_history.dart';
import 'package:dolaraldia_argentina/models/history/history_date_group.dart';
import 'package:dolaraldia_argentina/models/history/history_response.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/widgets/history/date_field.dart';
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

  Future<List<HistoryDateGroup>?> historyEntries = Future.value(null);

  Future<List<HistoryDateGroup>?> historySearchButtonCallback() async {
    final response = await getApiHistory(
      currentDropdownValue,
      startDate,
      searchByRange ? endDate : startDate,
    );

    if (response == null || response.priceDataHistory == null) {
      return [];
    }

    return response.priceDataHistory;
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
  void initState() {
    super.initState();
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
          onPressedHandler: () {
            setState(() {
              historyEntries = historySearchButtonCallback();
            });
          },
        ),
        const Gap(10),
        FutureBuilder(
          future: historyEntries,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Container();
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                      'No hay resultados para mostrar para el rango indicado.'),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return HistoryEntriesGroup(
                          dateGroup: snapshot.data![index],
                          rate: currentDropdownValue);
                    },
                  ),
                );
              }
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ],
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

class HistoryEntriesGroup extends StatelessWidget {
  const HistoryEntriesGroup({
    super.key,
    required this.dateGroup,
    required this.rate,
  });

  final HistoryDateGroup dateGroup;
  final HistoryRate rate;

  @override
  Widget build(BuildContext context) {
    final entries = [
      for (final entry in dateGroup.priceData)
        HistoryListEntry(data: entry, rate: rate)
    ];

    final title = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.calendar_month),
        const Gap(10.0),
        Text(
          dateGroup.dateGroup,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    return Column(
      children: [
        title,
        const Gap(5.0),
        ...entries,
        const Gap(20.0),
      ],
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
