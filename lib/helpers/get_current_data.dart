import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/models/api/rate_data.dart';

RateData getCurrentData(ApiResponse data, Rate rate) {
  return switch (rate) {
    Rate.bcv => data.dataBcv,
    Rate.paralelo => data.dataParalelo,
    Rate.euro => data.dataEuro,
    Rate.petro => data.dataPetro,
    _ => data.dataBcv,
  };
}
