import 'package:chopper/chopper.dart';
import 'package:simple_app/common/constants.dart';
import 'package:simple_app/data/remote/helper/json_serializable_converter.dart';

class SimpleApi {
  static ChopperClient getClient() {
    String baseUrl = '';
    if (Constants.environment == Env.dev) {
      baseUrl = Constants.baseUrlDev;
    } else if (Constants.environment == Env.stagging) {
      baseUrl = Constants.baseUrlStagging;
    } else if (Constants.environment == Env.prod) {
      baseUrl = Constants.baseUrlProd;
    }
    return ChopperClient(
      baseUrl: baseUrl,
      converter: JsonSerializableConverter(),
    );
  }
}
