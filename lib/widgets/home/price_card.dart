import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_current_data.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/providers/cubits/api_data_cubit.dart';
import 'package:dolaraldia_argentina/providers/cubits/rate_cubit.dart';
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
    final data = BlocProvider.of<ApiDataCubit>(context).state as ApiResponse;

    final currentData = getCurrentData(data, rate);

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

    return Column(
      children: [
        const Text('Precio Actual'),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(price),
            Icon(
              icon,
              color: color,
            ),
            Text(
              percent,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
        const Gap(5),
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
    return FittedBox(
      child: Column(
        children: [
          Text(description),
          Text(content),
        ],
      ),
    );
  }
}
