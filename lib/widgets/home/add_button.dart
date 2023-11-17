import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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
    return SizedBox(
      child: TextButton(
        onPressed: onTapHandler,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            const Icon(
              Icons.monetization_on_outlined,
            ),
            const SizedBox(width: 5.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Text(
                value.padLeft(6),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );

    // return Container(
    //   width: 100.0,
    //   padding: const EdgeInsets.all(8.0),
    //   child: InkWell(
    //     onTap: onTapHandler,
    //     child: Wrap(
    //       spacing: 5.0,
    //       children: [
    //         const Icon(Icons.monetization_on),
    //         Text(value),
    //       ],
    //     ),
    //   ),
    // );
  }
}
