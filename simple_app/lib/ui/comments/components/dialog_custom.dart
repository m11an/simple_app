import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/model/comments.dart';

class DialogCustom {
  Widget getDialog(BuildContext context, Comments comments) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(comments.name!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(comments.email!), Text(comments.body!)],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(comments.name!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(comments.email!), Text(comments.body!)],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      );
    }
  }
}
