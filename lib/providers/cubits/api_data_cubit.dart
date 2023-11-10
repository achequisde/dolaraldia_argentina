import 'package:dolaraldia_argentina/interfaces/data_response.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiDataCubit extends Cubit<DataResponse> {
  ApiDataCubit(DataResponse response) : super(response);

  void update(ApiResponse response) => emit(response);
}
