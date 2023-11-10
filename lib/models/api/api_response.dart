import 'package:dolaraldia_argentina/interfaces/data_response.dart';
import 'package:dolaraldia_argentina/models/api/rate_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse extends DataResponse with _$ApiResponse {
  const factory ApiResponse({
    @JsonKey(name: 'DataBcv') required RateData dataBcv,
    @JsonKey(name: 'DataParalelo') required RateData dataParalelo,
    @JsonKey(name: 'DataEuro') required RateData dataEuro,
    @JsonKey(name: 'DataPetro') required RateData dataPetro,
    @JsonKey(name: 'Status') required bool status,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseFromJson(json);
}
