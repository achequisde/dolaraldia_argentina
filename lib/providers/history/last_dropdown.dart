import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastDropdownCubit extends Cubit<HistoryRate?> {
  LastDropdownCubit() : super(null);

  void update(HistoryRate rate) => emit(rate);
}
