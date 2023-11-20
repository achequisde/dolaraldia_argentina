import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastCryptoInputCubit extends Cubit<Input?> {
  LastCryptoInputCubit() : super(null);

  void setTop() => emit(Input.top);
  void setBottom() => emit(Input.bottom);
  void reset() => emit(null);
}
