import 'package:dolaraldia_argentina/enums/input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastValueCubit extends Cubit<String?> {
  LastValueCubit() : super(null);

  void update(String val) => emit(val);
  void reset() => emit(null);

  @override
  void onChange(Change<String?> change) {
    super.onChange(change);
  }
}
