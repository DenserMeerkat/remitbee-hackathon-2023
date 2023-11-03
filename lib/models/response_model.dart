import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@Freezed()
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required bool success,
    required double result,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, Object?> json) =>
      _$ResponseModelFromJson(json);
}
