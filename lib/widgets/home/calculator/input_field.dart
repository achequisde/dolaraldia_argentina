import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_api_input.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_api_value.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_crypto_input.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_crypto_value.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.inputType,
    required this.controller,
    required this.isCrypto,
  });

  final Input inputType;
  final TextEditingController controller;
  final bool isCrypto;

  @override
  Widget build(BuildContext context) {
    void onTapHandler() {
      if (isCrypto) {
        switch (inputType) {
          case Input.top:
            BlocProvider.of<LastCryptoInputCubit>(context).setTop();
            break;
          case Input.bottom:
            BlocProvider.of<LastCryptoInputCubit>(context).setBottom();
            break;
        }
      } else {
        switch (inputType) {
          case Input.top:
            BlocProvider.of<LastApiInputCubit>(context).setTop();
            break;
          case Input.bottom:
            BlocProvider.of<LastApiInputCubit>(context).setBottom();
            break;
        }
      }

      controller.selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.text.length,
        ),
      );
    }

    return TextFormField(
      controller: controller,
      onTap: onTapHandler,
      textAlign: TextAlign.end,
      onChanged: (value) {
        if (isCrypto) {
          BlocProvider.of<LastCryptoValueCubit>(context).update(value);
        } else {
          BlocProvider.of<LastApiValueCubit>(context).update(value);
        }

        final n = (double.tryParse(value) ?? 0) / 100;
        controller.text = usToVeDecimal(n);
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
