import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_input_cubit.dart';
import 'package:dolaraldia_argentina/providers/cubits/rate_cubit.dart';
import 'package:dolaraldia_argentina/widgets/home/calculator.dart';
import 'package:dolaraldia_argentina/widgets/home/price_card.dart';
import 'package:dolaraldia_argentina/widgets/home/swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: BlocBuilder<RateCubit, Rate>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              const Gap(20),
              PriceCard(
                rate: state,
              ),
              const Gap(10),
              const Swiper(
                itemSize: 65,
                gap: 0.19,
              ),
              const Gap(10),
              // ignore: prefer_const_constructors
              Calculator(),
            ],
          );
        },
      ),
    );
  }
}
