import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:simple_app/data/repository/comments_repository.dart';
import 'package:simple_app/model/comments.dart';
import 'package:simple_app/model/data_wrapper.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<CommentsEvent>((event, emit) async {
      if (event is GetComments) {
        if (state is CommentsLoaded) {
          emit(LoadingComments());
        }
        DataWrapper<List<Comments>> dataWrapper =
            await CommentsRepository().fetchAllComments();

        emit(CommentsLoaded(dataWrapper.data!));
      }
    });
  }
}
