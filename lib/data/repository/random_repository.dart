import 'dart:convert';

import 'package:flutter_code_standardization/data/repository/base_repository.dart';
import 'package:flutter_code_standardization/generated/json/base/json_convert_content.dart';
import 'package:flutter_code_standardization/model/response/random_response_entity.dart';

class RandomRespository {
  Future<RandomResponseEntity?> getRandomImage() async {
    var response = await requestGET("breeds/image/random");
    print("response is clear $response");
    return JsonConvert.fromJsonAsT<RandomResponseEntity>(
        jsonDecode(response.body));
  }
}
