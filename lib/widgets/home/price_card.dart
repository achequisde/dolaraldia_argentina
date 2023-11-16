import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_current_crypto_data.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/models/api/rate_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/crypto_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/rate.dart';
import 'package:dolaraldia_argentina/utils/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    super.key,
    required this.rate,
  });

  final Rate rate;

  @override
  Widget build(BuildContext context) {
    final isCrypto = switch (rate) {
      Rate.btc || Rate.eth || Rate.usdt => true,
      _ => false,
    };

    late final RateData currentData;

    if (isCrypto) {
      final data = BlocProvider.of<CryptoDataCubit>(context).state;
      currentData =
          RateData.fromCryptoRateData(getCurrentCryptoData(data, rate), data.timestamp);
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

    final title = Text(
      'Precio Actual',
      style: Theme.of(context).textTheme.headlineSmall,
    );

    final priceWidget = Text(
      price,
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
        title,
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            priceWidget,
            Icon(
              icon,
              size: 32.0,
              color: color,
            ),
            percentWidget,
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Info(
              description: 'Cambio:',
              content: BlocProvider.of<RateCubit>(context).state.name,
            ),
            Info(
              description: 'Fecha',
              content: date,
            ),
            Info(
              description: 'Hora',
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
      style: Theme.of(context).textTheme.bodyLarge,
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
