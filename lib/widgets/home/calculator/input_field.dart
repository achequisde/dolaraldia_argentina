import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_input.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.inputType,
    required this.controller,
  });

  final Input inputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    void onTapHandler() {
      switch (inputType) {
        case Input.top:
          BlocProvider.of<LastInputCubit>(context).setTop();
          break;
        case Input.bottom:
          BlocProvider.of<LastInputCubit>(context).setBottom();
          break;
      }
    }

    return TextFormField(
      controller: controller,
      onTap: onTapHandler,
      textAlign: TextAlign.end,
      onChanged: (value) {
        print(value);
        final n = double.parse(value) / 100;
        controller.text = usToVeDecimal(n);
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
