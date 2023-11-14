import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/helpers/get_rate_icon_path.dart';
import 'package:dolaraldia_argentina/providers/cubits/rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Swiper extends StatefulWidget {
  // Magic number, should be very high to give the illusion of an infinite loop
  // ignore: constant_identifier_names
  static const MAX_INT = 9223372036854;
  // We start at a number somewhat around the middle so the user can go back and forth
  // We multiply by the length of Rate.values so the Swiper begins at the first item
  // ignore: non_constant_identifier_names
  static final START_INDEX = 922337203685 * Rate.values.length;

  const Swiper({
    super.key,
    required this.itemSize,
    required this.gap,
  });

  final double itemSize;
  final double gap;

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  var currentPage = Swiper.START_INDEX;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      initialPage: Swiper.START_INDEX,
      viewportFraction: widget.gap,
    );

    void onPageChangedHandler(int? newPageIndex) {
      BlocProvider.of<RateCubit>(context)
          .update(Rate.values[newPageIndex! % Rate.values.length]);

      setState(() {
        currentPage = newPageIndex;
      });
    }

    return SizedBox(
      height: widget.itemSize,
      child: PageView.builder(
        onPageChanged: onPageChangedHandler,
        controller: pageController,
        itemCount: Swiper.MAX_INT,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // Padding is using to shrink unselected items
          double? padding;

          if (index != currentPage) {
            padding = 10.0;
          }

          final rateIcon =
              getRateIconPath(Rate.values[index % Rate.values.length]);

          return AnimatedContainer(
            padding: EdgeInsets.all(padding ?? 0.0),
            duration: const Duration(milliseconds: 250),
            child: Image.asset(rateIcon),
          );
        },
      ),
    );
  }
}
