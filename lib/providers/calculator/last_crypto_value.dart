import 'package:flutter_bloc/flutter_bloc.dart';

class LastCryptoValueCubit extends Cubit<String?> {
  LastCryptoValueCubit() : super(null);

  void update(String val) => emit(val);
  void reset() => emit(null);
}
