import 'package:dolaraldia_argentina/enums/rate.dart';

const bcvMetadata = (
  // TextFormField metadata
  top: (
    prefixText: '\$',
    hintText: 'USD',
  ),
  bottom: (
    prefixText: 'Bs.',
    hintText: 'VES',
  )
);

const paraleloMetadata = (
  // TextFormField metadata
  top: (
    prefixText: '\$',
    hintText: 'USD',
  ),
  bottom: (
    prefixText: 'Bs.',
    hintText: 'VES',
  )
);

const euroMetadata = (
  // TextFormField metadata
  top: (
    prefixText: '€',
    hintText: 'EUR',
  ),
  bottom: (
    prefixText: 'Bs.',
    hintText: 'VES',
  )
);

const petroMetadata = (
  // TextFormField metadata
  top: (
    prefixText: '\$',
    hintText: 'PTR',
  ),
  bottom: (
    prefixText: 'Bs.',
    hintText: 'VES',
  )
);

({
  ({String hintText, String prefixText}) bottom,
  ({String hintText, String prefixText}) top
}) getRateMetadata(Rate rate) {
  return switch (rate) {
    Rate.bcv => bcvMetadata,
    Rate.paralelo => paraleloMetadata,
    Rate.euro => euroMetadata,
    Rate.petro => petroMetadata,
    Rate.btc => bcvMetadata,
    Rate.eth => bcvMetadata,
    Rate.usdt => bcvMetadata,
  };
}
