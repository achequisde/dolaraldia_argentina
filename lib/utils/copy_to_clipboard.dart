import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> copyToClipBoard(
  GlobalKey<TooltipState> tooltipKey,
  String text,
) async {
  final data = ClipboardData(text: text);
  await Clipboard.setData(data).then((value) {
    tooltipKey.currentState?.ensureTooltipVisible();
    Future.delayed(const Duration(milliseconds: 500), () {
      Tooltip.dismissAllToolTips();
    });
  });
}
