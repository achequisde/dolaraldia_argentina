import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastInputCubit extends Cubit<Input?> {
  LastInputCubit() : super(null);

  void setTop() => emit(Input.top);
  void setBottom() => emit(Input.bottom);
  void reset() => emit(null);

  @override
  void onChange(Change<Input?> change) {
    super.onChange(change);
  }
}
