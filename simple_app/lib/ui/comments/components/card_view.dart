import 'package:flutter/material.dart';
import 'package:simple_app/model/comments.dart';
import 'package:simple_app/ui/comments/components/dialog_custom.dart';

class CardView extends StatelessWidget {
  final Comments? comment;

  const CardView({required this.comment, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return comment != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return DialogCustom().getDialog(ctx, comment!);
                    });
              },
              child: Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  comment!.name != null ? comment!.name! : '',
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  comment!.email != null ? comment!.email! : '',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                comment!.postId != null
                                    ? '${comment!.postId!}'
                                    : '',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${comment!.id}'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          comment!.body != null ? comment!.body! : '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox(
            width: 0,
            height: 0,
          );
  }
}
