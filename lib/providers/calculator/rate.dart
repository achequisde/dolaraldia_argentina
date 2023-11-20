import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RateCubit extends Cubit<Rate> {
  RateCubit() : super(Rate.bcv);

  void update(Rate newRate) => emit(newRate);
}
