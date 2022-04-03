part of 'comments_bloc.dart';

@immutable
abstract class CommentsState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comments> listOfComments;

  CommentsLoaded(this.listOfComments);
}

class LoadingComments extends CommentsState {}
