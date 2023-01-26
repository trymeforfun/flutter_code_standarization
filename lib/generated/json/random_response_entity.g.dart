import 'package:flutter_code_standardization/generated/json/base/json_convert_content.dart';
import 'package:flutter_code_standardization/model/response/random_response_entity.dart';

RandomResponseEntity $RandomResponseEntityFromJson(Map<String, dynamic> json) {
  final randomEntity = RandomResponseEntity();

  final String? status = jsonConvert.asT<String>(json['status']);
  if (status != null) {
    randomEntity.status = status;
  }

  final String? message = jsonConvert.asT<String>(json['message']);
  if (message != null) {
    randomEntity.message = message;
  }

  return randomEntity;
}

Map<String, dynamic> $RandomResponseEntityToJson(RandomResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  return data;
}
