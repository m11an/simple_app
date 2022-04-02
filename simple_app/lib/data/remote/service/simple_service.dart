import 'package:chopper/chopper.dart';

import '/data/remote/simple_api.dart';
import '../../../model/comments.dart';

part 'simple_service.chopper.dart';

@ChopperApi()
abstract class SimpleService extends ChopperService {
  static SimpleService create() {
    return _$SimpleService(SimpleApi.getClient());
  }

  @Get(path: 'comments')
  Future<Response<List<Comments>>> getComments();
}
