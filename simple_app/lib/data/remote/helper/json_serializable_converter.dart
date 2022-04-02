import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'json_type_parser.dart';

class JsonSerializableConverter extends JsonConverter {
  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    if (response.body != null && response.body.toString().isNotEmpty) {
      final jsonRes = super.convertResponse(response);
      var decodedItem = JsonTypeParser.decode<Item>(json.decode(response.body));
      return jsonRes.copyWith<ResultType>(body: decodedItem as ResultType);
    } else {
      Response<Map> map = Response(response.base, const {});
      return map.copyWith(body: {} as ResultType);
    }
  }
}
