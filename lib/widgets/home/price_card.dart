import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/utils/copy_to_clipboard.dart';
import 'package:dolaraldia_argentina/helpers/get_current_crypto_data.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/helpers/get_rate_icon_path.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/models/api/rate_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/crypto_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/rate.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    super.key,
    required this.rate,
  });

  final Rate rate;

  @override
  Widget build(BuildContext context) {
    final tooltipKey = GlobalKey<TooltipState>();

    final isCrypto = switch (rate) {
      Rate.btc || Rate.eth || Rate.usdt => true,
      _ => false,
    };

    late final RateData currentData;

    if (isCrypto) {
      final data = BlocProvider.of<CryptoDataCubit>(context).state;
      currentData = RateData.fromCryptoRateData(
          getCurrentCryptoData(data, rate), data.timestamp);
    } else {
      final data = BlocProvider.of<ApiDataCubit>(context).state as ApiResponse;
      currentData = getCurrentData(data, rate);
    }

    final price = currentData.price;
    final date = currentData.date;
    final hour = currentData.hour;
    final percent = currentData.valuePercent;

    final icon = switch (currentData.icon) {
      'ic_up_green' => Icons.arrow_upward,
      'ic_down_red' => Icons.arrow_downward,
      _ => Icons.drag_handle,
    };

    final color = switch (currentData.icon) {
      'ic_up_green' => Colors.greenAccent,
      'ic_down_red' => Colors.redAccent,
      _ => Colors.grey,
    };

    const title = Expanded(
      child: Text(
        'Precio Actual',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    final priceWidget = Text(
      '${isCrypto ? '\$' : 'Bs.'} $price',
      style: Theme.of(context).textTheme.displaySmall,
    );

    final percentWidget = Text(
      percent,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: color,
          ),
    );

    return Column(
      children: [
        Row(
          children: [
            const Gap(26.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SvgPicture.asset(
                'assets/logo_dolar_al_dia.svg',
                fit: BoxFit.contain,
                height: 32.0,
              ),
            ),
            title,
            IconButton(
              onPressed: () {
                // goToUrl();
              },
              icon: Image.asset(
                getRateIconPath(rate),
                fit: BoxFit.contain,
                height: 32.0,
              ),
            ),
            const Gap(26.0),
          ],
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            priceWidget,
            const Gap(4.0),
            Tooltip(
              message: '¡Copiado!',
              showDuration: const Duration(milliseconds: 100),
              key: tooltipKey,
              triggerMode: TooltipTriggerMode.manual,
              child: IconButton(
                icon: const Icon(
                  Icons.copy_rounded,
                  size: 20.0,
                ),
                onPressed: () async {
                  await copyToClipBoard(tooltipKey, price);
                },
              ),
            ),
            Icon(
              icon,
              size: 16.0,
              color: color,
            ),
            percentWidget,
          ],
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Info(
              description: 'Tasa:',
              content: BlocProvider.of<RateCubit>(context).state.name,
            ),
            Info(
              description: 'Fecha:',
              content: date,
            ),
            Info(
              description: 'Hora:',
              content: hour,
            ),
          ],
        ),
        const Gap(5),
      ],
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.description,
    required this.content,
  });

  final String description;
  final String content;

  @override
  Widget build(BuildContext context) {
    final descriptionWidget = Text(
      description,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16.0,
          ),
    );

    final contentWidget = Text(
      content.capitalize(),
      style: Theme.of(context).textTheme.bodyLarge,
    );

    return FittedBox(
      child: Column(
        children: [
          descriptionWidget,
          contentWidget,
        ],
      ),
    );
  }
}
