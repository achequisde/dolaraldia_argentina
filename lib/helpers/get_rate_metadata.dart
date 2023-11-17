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
    prefixText: '₽',
    hintText: 'PTR',
  ),
  bottom: (
    prefixText: 'Bs.',
    hintText: 'VES',
  )
);

const btcMetadata = (
  // TextFormField metadata
  top: (
    prefixText: '₿',
    hintText: 'BTC',
  ),
  bottom: (
    prefixText: '\$',
    hintText: 'USD',
  )
);

const ethMetadata = (
  // TextFormField metadata
  top: (
    prefixText: 'Ξ',
    hintText: 'ETH',
  ),
  bottom: (
    prefixText: '\$',
    hintText: 'USD',
  )
);

const usdtMetadata = (
  // TextFormField metadata
  top: (
    prefixText: '₮',
    hintText: 'USDT',
  ),
  bottom: (
    prefixText: '\$',
    hintText: 'USD',
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
    Rate.btc => btcMetadata,
    Rate.eth => ethMetadata,
    Rate.usdt => usdtMetadata,
  };
}
