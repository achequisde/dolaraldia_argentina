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
  var entries = <String>[];

  void historySearchButtonCallback() {
    setState(() {
      entries = ['Hola', 'Ueah'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hi'),
        const Gap(10),
        HistoryDateField(),
        HistoryDateField(),
        const Gap(10),
        HistoryDropdown(),
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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1980),
          lastDate: DateTime(2025),
        );
      },
      decoration: const InputDecoration(
        hintText: 'Fine',
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

  final List<String> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return Text(
          entries[index],
        );
      },
    );
  }
}

class HistoryDropdown extends StatefulWidget {
  const HistoryDropdown({
    super.key,
  });

  @override
  State<HistoryDropdown> createState() => _HistoryDropdownState();
}

class _HistoryDropdownState extends State<HistoryDropdown> {
  final labels = [
    'Bcv',
    'Paralelo',
    'Euro',
    'Petro',
  ];

  var dropdownValue = 'Bcv';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      iconEnabledColor: Theme.of(context).colorScheme.onSurface,
      underline: Container(
        height: 2.0,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      items: [
        DropdownMenuItem(
          value: labels[0],
          child: const Text('Bcv'),
        ),
        DropdownMenuItem(
          value: labels[1],
          child: const Text('Paralelo'),
        ),
        DropdownMenuItem(
          value: labels[2],
          child: const Text('Euro'),
        ),
        DropdownMenuItem(
          value: labels[3],
          child: const Text('Petro'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
