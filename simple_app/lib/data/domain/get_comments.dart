import 'package:simple_app/model/data_wrapper.dart';
import 'package:simple_app/model/comments.dart';

abstract class CommentsImp {
  Future<DataWrapper<List<Comments>>> fetchAllComments();
}
