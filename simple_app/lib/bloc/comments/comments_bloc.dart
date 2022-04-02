import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_app/data/repository/post_repository.dart';
import 'package:simple_app/model/comments.dart';
import 'package:simple_app/model/data_wrapper.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<CommentsEvent>((event, emit) async {
      if (event is GetComments) {
        DataWrapper<List<Comments>> dataWrapper =
            await PostRepository().getPosts();
        emit(CommentsLoaded(dataWrapper.data));
      }
    });
  }
}
