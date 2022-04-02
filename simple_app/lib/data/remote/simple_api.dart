import 'package:chopper/chopper.dart';
import 'package:simple_app/data/remote/helper/json_serializable_converter.dart';

class SimpleApi {
  static ChopperClient getClient() {
    return ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      converter: JsonSerializableConverter(),
    );
  }
}
