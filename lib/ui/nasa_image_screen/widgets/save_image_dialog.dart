import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/extensions/localization_extension.dart';

class SaveImageDialog extends StatelessWidget {
  final String content;

  const SaveImageDialog({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AlertDialog(
            title: Text(context.localizations.saveDialogTitle),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => _onActionTap(context),
                child: Text(context.localizations.saveDialogButtonTitle),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: Text(context.localizations.saveDialogTitle),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                child: Text(context.localizations.saveDialogButtonTitle),
                onPressed: () => _onActionTap(context),
              ),
            ],
          ) as Widget;
  }

  void _onActionTap(BuildContext context) {
    Navigator.pop(context);
  }
}
