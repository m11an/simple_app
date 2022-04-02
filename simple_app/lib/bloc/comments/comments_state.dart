part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comments>? listOfComments;

  CommentsLoaded(this.listOfComments);
}
