import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.value,
    required this.onTapHandler,
  });

  final String value;
  final void Function() onTapHandler;

  @override
  Widget build(BuildContext context) {
    final buttonText = Text(
      value.padLeft(6),
      overflow: TextOverflow.ellipsis,
    );

    const buttonIcon = Icon(
      Icons.monetization_on_outlined,
    );

    return SizedBox(
      child: TextButton(
        onPressed: onTapHandler,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            buttonIcon,
            const Gap(5.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
