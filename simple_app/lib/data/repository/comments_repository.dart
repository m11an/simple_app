import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_app/common/constants.dart';
import 'package:simple_app/common/utiliy.dart';
import 'package:simple_app/data/domain/get_comments.dart';
import 'package:simple_app/data/remote/service/simple_service.dart';
import 'package:simple_app/model/comments.dart';
import '/../model/data_wrapper.dart';

class CommentsRepository implements CommentsImp {
  @override
  Future<DataWrapper<List<Comments>>> fetchAllComments() async {
    DataWrapper<List<Comments>> dataWrapper = DataWrapper();
    List<Comments> listOfComments = [];
    var box = await Hive.openBox(Constants.tableCommentsName);
    if (await Utility.checkInternet()) {
      SimpleService service = SimpleService.create();
      await service.getComments().then((response) {
        if (response.statusCode >= 200 &&
            response.statusCode <= 299 &&
            response.body != null) {
          listOfComments.addAll(response.body!);
          for (Comments c in listOfComments) {
            if (!box.values.contains(c)) {
              box.add(c);
            }
          }
          dataWrapper.data = listOfComments;
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
    } else {
      if (box.isNotEmpty) {
        for (var element in box.values) {
          listOfComments.add(element);
        }
      }
      dataWrapper.data = listOfComments;
      dataWrapper.code = 101;
      dataWrapper.msg = '';
    }
    return dataWrapper;
  }
}
