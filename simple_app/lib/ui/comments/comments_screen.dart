import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/card_view.dart';
import '../../components/circular_loading.dart';

import '/bloc/comments/comments_bloc.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var refreshkey = GlobalKey<RefreshIndicatorState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple app'),
      ),
      body: BlocProvider(
        create: (ctx) => CommentsBloc(),
        child: BlocBuilder<CommentsBloc, CommentsState>(
          builder: (blocCtx, state) {
            if (state is CommentsInitial) {
              BlocProvider.of<CommentsBloc>(blocCtx).add(GetComments());
              return const CircularLoading();
            } else if (state is CommentsLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  refreshkey.currentState?.show(atTop: true);
                  BlocProvider.of<CommentsBloc>(blocCtx).add(GetComments());
                },
                child: state.listOfComments.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return CardView(
                            comment: state.listOfComments[index],
                          );
                        },
                        itemCount: state.listOfComments.length,
                      )
                    : ListView(
                        children: const [
                          Center(
                            child: Text('No comments'),
                          ),
                        ],
                      ),
              );
            } else if (state is LoadingComments) {
              return const CircularLoading();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
