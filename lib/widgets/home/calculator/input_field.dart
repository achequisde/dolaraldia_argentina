import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_rate_metadata.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_value.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_value.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.inputType,
    required this.controller,
    required this.rate,
    required this.isCrypto,
  });

  final Input inputType;
  final TextEditingController controller;
  final Rate rate;
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

    final meta = getRateMetadata(rate);

    final metadata = switch (inputType) {
      Input.top => meta.top,
      Input.bottom => meta.bottom,
    };

    return Material(
      borderRadius: BorderRadius.circular(20.0),
      child: TextFormField(
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
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0.6,
              )),
          suffixIcon: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: Icon(
              Icons.copy_rounded,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          hintText: metadata.hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            overflow: TextOverflow.ellipsis,
          ),
          prefix: Text(
            metadata.prefixText,
          ),
        ),
        style: TextStyle(
          fontSize: 18.0,
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
