import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:flutter/material.dart';

class HistoryDateField extends StatelessWidget {
  const HistoryDateField({
    super.key,
    required this.date,
    required this.onDatePickerCallback,
    required this.validatorCallback,
    required this.labelText,
    this.enabled = true,
  });

  final DateTime date;
  final Function(DateTime) onDatePickerCallback;
  final String? Function(String?) validatorCallback;
  final String labelText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final controller = TextEditingController(text: date.toVEDate());

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          enableInteractiveSelection: false,
          readOnly: true,
          textAlign: TextAlign.center,
          validator: validatorCallback,
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
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        elevation: 10.0,
                      ),
                    ),
                    child: child!,
                  ),
                );
              },
            );

            final temp = controller.text;

            if (picked != null) {
              controller.text = picked.toVEDate();
            }

            if (formKey.currentState!.validate()) {
              if (picked != null) {
                onDatePickerCallback(picked);
              }
            } else {
              controller.text = temp;
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
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.center,
          ),
        ),
      ),
    );
  }
}
