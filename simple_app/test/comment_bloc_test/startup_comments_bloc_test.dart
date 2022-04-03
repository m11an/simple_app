import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_app/bloc/comments/comments_bloc.dart';
import 'package:simple_app/data/mock/mock_comments_repository.dart';

void main() {
  group('CommentsBloc -', () {
    late CommentsBloc commentsBloc;
    setUp(() async {
      EquatableConfig.stringify = true;
      commentsBloc = CommentsBloc();
    });

    blocTest<CommentsBloc, CommentsState>(
      'emits CommentsLoaded when GetComments is added.',
      build: () => commentsBloc,
      act: (bloc) => bloc.add(GetComments()),
      expect: () => [
        CommentsLoaded(mockComments),
      ],
    );

    blocTest<CommentsBloc, CommentsState>(
      'emits first LoadingComments when state is already CommentsLoaded and than emits CommentsLoaded.',
      build: () => commentsBloc,
      seed: () => CommentsLoaded(mockComments),
      act: (bloc) => bloc.add(GetComments()),
      expect: () => [
        LoadingComments(),
        CommentsLoaded(mockComments),
      ],
    );

    tearDown(() {
      commentsBloc.close();
    });
  });
}
