import 'package:flutter_code_standardization/generated/json/random_response_entity.g.dart';

class RandomResponseEntity {
  RandomResponseEntity();

  factory RandomResponseEntity.fromJson(Map<String, dynamic> json) =>
      $RandomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $RandomResponseEntityToJson(this);

  String? status;
  String? message;
}
