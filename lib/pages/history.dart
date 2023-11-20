import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/helpers/create_date_validator.dart';
import 'package:dolaraldia_argentina/helpers/get_api_history.dart';
import 'package:dolaraldia_argentina/models/history/history_date_group.dart';
import 'package:dolaraldia_argentina/models/history/history_response.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:dolaraldia_argentina/utils/ve_to_us.dart';
import 'package:dolaraldia_argentina/widgets/history/chart.dart';
import 'package:dolaraldia_argentina/widgets/history/date_field.dart';
import 'package:dolaraldia_argentina/widgets/history/dropdown.dart';
import 'package:dolaraldia_argentina/widgets/history/search_entry.dart';
import 'package:dolaraldia_argentina/widgets/history/search_button.dart';
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

  final topDateFieldController = TextEditingController();
  final bottomDateFieldController = TextEditingController();

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
  Widget build(BuildContext context) {
    final topFieldValidatorCallback =
        createDateValidatorCallback((p0) => p0.isAfter(endDate) && searchByRange);

    final bottomFieldValidatorCallback =
        createDateValidatorCallback((p0) => p0.isBefore(startDate));

    final historyOptionsCard = Column(
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
              labelText: 'Inicio',
              validatorCallback: topFieldValidatorCallback,
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
              labelText: 'Fin',
              validatorCallback: bottomFieldValidatorCallback,
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
        const Gap(20),
      ],
    );

    return FutureBuilder(
      future: historyEntries,
      builder: (context, snapshot) {
        late final dynamic historyDateGroups;
        Widget? chart;

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            historyDateGroups = SliverToBoxAdapter(
              child: Container(),
            );
          } else if (snapshot.data!.isEmpty) {
            historyDateGroups = const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Text(
                    'No hay resultados para mostrar para el rango indicado.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else {
            final chartData = [
              for (final entry in snapshot.data!)
                for (final entryData in entry.priceData)
                  (
                    veToUsDecimal(entryData.price).toDouble(),
                    entryData.date,
                    entryData.hour
                  )
            ];

            final prices = chartData.map((e) => e.$1).toList();
            final dates = chartData.map((e) => e.$2).toList();
            final hours = chartData.map((e) => e.$3).toList();

            chart = Chart(
              prices: prices,
              dates: dates,
              hours: hours,
              isCrypto: false,
            );

            historyDateGroups = SliverList.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return HistoryEntriesGroup(
                  dateGroup: snapshot.data![index],
                  rate: currentDropdownValue,
                );
              },
            );
          }
        } else {
          historyDateGroups = const SliverToBoxAdapter(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: historyOptionsCard,
            ),
            if (chart != null)
              SliverToBoxAdapter(
                child: Visibility(
                  visible: showGraph,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 28.0,
                      bottom: 10.0,
                      left: 10.0,
                      right: 20.0,
                    ),
                    margin: const EdgeInsets.only(bottom: 20.0),
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: chart,
                  ),
                ),
              ),
            historyDateGroups,
          ],
        );
      },
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
      for (final entry in dateGroup.priceData) ...[
        HistorySearchEntry(data: entry, rate: rate),
        const Gap(10.0),
      ]
    ];

    final title = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.calendar_today,
          color: Theme.of(context).colorScheme.onSurface,
          size: 18.0,
        ),
        const Gap(10.0),
        Text(
          dateGroup.dateGroup,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.96,
          child: Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.onBackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(20.0),
                title,
                const Gap(10.0),
                ...entries,
                const Gap(10.0),
              ],
            ),
          ),
        ),
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
