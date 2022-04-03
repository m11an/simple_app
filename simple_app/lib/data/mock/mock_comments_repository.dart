import 'package:simple_app/data/domain/get_comments.dart';
import 'package:simple_app/model/comments.dart';
import 'package:simple_app/model/data_wrapper.dart';

List<Comments> mockComments = [
  const Comments(
    id: 1,
    body: 'agnagdadgad',
    email: 'test@gmail.com',
    name: 'asagf',
    postId: 0,
  ),
  const Comments(
    id: 2,
    body: 'agnagdadgad',
    email: 'test@gmail.com',
    name: 'asagf',
    postId: 1,
  ),
  const Comments(
    id: 3,
    body: 'agnagdadgad',
    email: 'test@gmail.com',
    name: 'asagf',
    postId: 0,
  ),
  const Comments(
    id: 4,
    body: 'agnagdadgad',
    email: 'test@gmail.com',
    name: 'asagf',
    postId: 2,
  ),
  const Comments(
    id: 5,
    body: 'agnagdadgad',
    email: 'test@gmail.com',
    name: 'asagf',
    postId: 4,
  ),
];

class MockCommentsRepository implements CommentsImp {
  @override
  Future<DataWrapper<List<Comments>>> fetchAllComments() async {
    DataWrapper<List<Comments>> dataWrapper = DataWrapper();
    dataWrapper.data = mockComments;
    dataWrapper.code = 200;
    dataWrapper.msg = '';
    return dataWrapper;
  }
}
