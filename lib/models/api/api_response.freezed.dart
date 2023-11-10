// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  @JsonKey(name: 'DataBcv')
  RateData get dataBcv => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataParalelo')
  RateData get dataParalelo => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataEuro')
  RateData get dataEuro => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataPetro')
  RateData get dataPetro => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  bool get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DataBcv') RateData dataBcv,
      @JsonKey(name: 'DataParalelo') RateData dataParalelo,
      @JsonKey(name: 'DataEuro') RateData dataEuro,
      @JsonKey(name: 'DataPetro') RateData dataPetro,
      @JsonKey(name: 'Status') bool status});

  $RateDataCopyWith<$Res> get dataBcv;
  $RateDataCopyWith<$Res> get dataParalelo;
  $RateDataCopyWith<$Res> get dataEuro;
  $RateDataCopyWith<$Res> get dataPetro;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataBcv = null,
    Object? dataParalelo = null,
    Object? dataEuro = null,
    Object? dataPetro = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      dataBcv: null == dataBcv
          ? _value.dataBcv
          : dataBcv // ignore: cast_nullable_to_non_nullable
              as RateData,
      dataParalelo: null == dataParalelo
          ? _value.dataParalelo
          : dataParalelo // ignore: cast_nullable_to_non_nullable
              as RateData,
      dataEuro: null == dataEuro
          ? _value.dataEuro
          : dataEuro // ignore: cast_nullable_to_non_nullable
              as RateData,
      dataPetro: null == dataPetro
          ? _value.dataPetro
          : dataPetro // ignore: cast_nullable_to_non_nullable
              as RateData,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RateDataCopyWith<$Res> get dataBcv {
    return $RateDataCopyWith<$Res>(_value.dataBcv, (value) {
      return _then(_value.copyWith(dataBcv: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateDataCopyWith<$Res> get dataParalelo {
    return $RateDataCopyWith<$Res>(_value.dataParalelo, (value) {
      return _then(_value.copyWith(dataParalelo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateDataCopyWith<$Res> get dataEuro {
    return $RateDataCopyWith<$Res>(_value.dataEuro, (value) {
      return _then(_value.copyWith(dataEuro: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RateDataCopyWith<$Res> get dataPetro {
    return $RateDataCopyWith<$Res>(_value.dataPetro, (value) {
      return _then(_value.copyWith(dataPetro: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseImplCopyWith(
          _$ApiResponseImpl value, $Res Function(_$ApiResponseImpl) then) =
      __$$ApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DataBcv') RateData dataBcv,
      @JsonKey(name: 'DataParalelo') RateData dataParalelo,
      @JsonKey(name: 'DataEuro') RateData dataEuro,
      @JsonKey(name: 'DataPetro') RateData dataPetro,
      @JsonKey(name: 'Status') bool status});

  @override
  $RateDataCopyWith<$Res> get dataBcv;
  @override
  $RateDataCopyWith<$Res> get dataParalelo;
  @override
  $RateDataCopyWith<$Res> get dataEuro;
  @override
  $RateDataCopyWith<$Res> get dataPetro;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseImpl>
    implements _$$ApiResponseImplCopyWith<$Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl _value, $Res Function(_$ApiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataBcv = null,
    Object? dataParalelo = null,
    Object? dataEuro = null,
    Object? dataPetro = null,
    Object? status = null,
  }) {
    return _then(_$ApiResponseImpl(
      dataBcv: null == dataBcv
          ? _value.dataBcv
          : dataBcv // ignore: cast_nullable_to_non_nullable
              as RateData,
      dataParalelo: null == dataParalelo
          ? _value.dataParalelo
          : dataParalelo // ignore: cast_nullable_to_non_nullable
              as RateData,
      dataEuro: null == dataEuro
          ? _value.dataEuro
          : dataEuro // ignore: cast_nullable_to_non_nullable
              as RateData,
      dataPetro: null == dataPetro
          ? _value.dataPetro
          : dataPetro // ignore: cast_nullable_to_non_nullable
              as RateData,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseImpl implements _ApiResponse {
  const _$ApiResponseImpl(
      {@JsonKey(name: 'DataBcv') required this.dataBcv,
      @JsonKey(name: 'DataParalelo') required this.dataParalelo,
      @JsonKey(name: 'DataEuro') required this.dataEuro,
      @JsonKey(name: 'DataPetro') required this.dataPetro,
      @JsonKey(name: 'Status') required this.status});

  factory _$ApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseImplFromJson(json);

  @override
  @JsonKey(name: 'DataBcv')
  final RateData dataBcv;
  @override
  @JsonKey(name: 'DataParalelo')
  final RateData dataParalelo;
  @override
  @JsonKey(name: 'DataEuro')
  final RateData dataEuro;
  @override
  @JsonKey(name: 'DataPetro')
  final RateData dataPetro;
  @override
  @JsonKey(name: 'Status')
  final bool status;

  @override
  String toString() {
    return 'ApiResponse(dataBcv: $dataBcv, dataParalelo: $dataParalelo, dataEuro: $dataEuro, dataPetro: $dataPetro, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl &&
            (identical(other.dataBcv, dataBcv) || other.dataBcv == dataBcv) &&
            (identical(other.dataParalelo, dataParalelo) ||
                other.dataParalelo == dataParalelo) &&
            (identical(other.dataEuro, dataEuro) ||
                other.dataEuro == dataEuro) &&
            (identical(other.dataPetro, dataPetro) ||
                other.dataPetro == dataPetro) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dataBcv, dataParalelo, dataEuro, dataPetro, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<_$ApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseImplToJson(
      this,
    );
  }
}

abstract class _ApiResponse implements ApiResponse {
  const factory _ApiResponse(
      {@JsonKey(name: 'DataBcv') required final RateData dataBcv,
      @JsonKey(name: 'DataParalelo') required final RateData dataParalelo,
      @JsonKey(name: 'DataEuro') required final RateData dataEuro,
      @JsonKey(name: 'DataPetro') required final RateData dataPetro,
      @JsonKey(name: 'Status') required final bool status}) = _$ApiResponseImpl;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$ApiResponseImpl.fromJson;

  @override
  @JsonKey(name: 'DataBcv')
  RateData get dataBcv;
  @override
  @JsonKey(name: 'DataParalelo')
  RateData get dataParalelo;
  @override
  @JsonKey(name: 'DataEuro')
  RateData get dataEuro;
  @override
  @JsonKey(name: 'DataPetro')
  RateData get dataPetro;
  @override
  @JsonKey(name: 'Status')
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
