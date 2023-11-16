import 'package:dolaraldia_argentina/models/crypto/crypto_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDataCubit extends Cubit<CryptoResponse> {
  CryptoDataCubit(CryptoResponse response) : super(response);

  void update(CryptoResponse response) => emit(response);
}
