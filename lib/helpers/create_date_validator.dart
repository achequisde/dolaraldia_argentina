import 'package:dolaraldia_argentina/utils/ve_to_us.dart';

String? Function(String?) createDateValidator(
    bool Function(DateTime) comparisonFun) {
  return (String? value) {
    final date = veToUsDate(value!);
    final comparison = comparisonFun(date);

    if (comparison) {
      return "Fecha inválida";
    }

    return null;
  };
}
