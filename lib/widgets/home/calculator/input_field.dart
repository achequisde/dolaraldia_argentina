import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_rate_metadata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.inputType,
    required this.controller,
    required this.rate,
    required this.isCryptoWithPetro,
    required this.onTapCallback,
    required this.onChangedCallback,
  });

  final Input inputType;
  final TextEditingController controller;
  final Rate rate;
  final bool isCryptoWithPetro;
  final Function() onTapCallback;
  final Function(String?) onChangedCallback;

  @override
  Widget build(BuildContext context) {
    final meta = getRateMetadata(rate);

    final metadata = switch (inputType) {
      Input.top => meta.top,
      Input.bottom => meta.bottom,
    };

    return Material(
      borderRadius: BorderRadius.circular(20.0),
      child: TextFormField(
        controller: controller,
        onTap: onTapCallback,
        textAlign: TextAlign.end,
        onChanged: onChangedCallback,
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
          fillColor: Theme.of(context).colorScheme.onBackground,
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
