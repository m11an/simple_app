import '/data/remote/service/simple_service.dart';
import '/model/data_wrapper.dart';
import '../../model/comments.dart';

class PostRepository {
  Future<DataWrapper<List<Comments>>> getPosts() async {
    DataWrapper<List<Comments>> dataWrapper = DataWrapper();
    SimpleService service = SimpleService.create();
    await service.getComments().then((response) {
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        dataWrapper.data = response.body;
        dataWrapper.code = response.statusCode;
        dataWrapper.msg = '';
      } else {
        dataWrapper.data = null;
        dataWrapper.code = response.statusCode;
        dataWrapper.msg = 'Something went wrong';
      }
    }).onError((error, stackTrace) {
      dataWrapper.data = null;
      dataWrapper.code = -1;
      dataWrapper.msg = 'Something went wrong';
    });
    return dataWrapper;
  }
}
