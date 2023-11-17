import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/providers/calculator/rate.dart';
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
        builder: (context, rate) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,),
            child: Column(
              children: <Widget>[
                const Gap(20),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: PriceCard(
                    rate: rate,
                  ),
                ),
                const Gap(20),
                const Swiper(
                  itemSize: 65,
                  gap: 0.19,
                ),
                const Gap(20),
                Calculator(
                  rate: rate,
                ),
                const Gap(20),
              ],
            ),
          );
        },
      ),
    );
  }
}
