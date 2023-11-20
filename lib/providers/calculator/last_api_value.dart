import 'package:flutter_bloc/flutter_bloc.dart';

class LastApiValueCubit extends Cubit<String?> {
  LastApiValueCubit() : super(null);

 void update(String val) => emit(val);
  void reset() => emit(null);
}
