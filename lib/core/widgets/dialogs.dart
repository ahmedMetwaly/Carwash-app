import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void showSnackBarDialog(
    {required BuildContext context, Widget? screen, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green[400],
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        Icon(Icons.check_circle_rounded,
            color: Theme.of(context).colorScheme.inversePrimary),
      ],
    ),
  ));
  Navigator.of(context).pop();
  if (screen != null) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  } else {
    Navigator.of(context).pop();
  }
}

Future<dynamic> errorDialog(
    BuildContext context, String errorTitle, String errorMessage) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(errorTitle),
      content: Column(
        children: [
          Text(errorMessage),
          Divider(
            height: 5,
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text(S.current.ok))
      ],
    ),
  );
}

void showAlertDialog({
  required BuildContext context,
  required String txt,
  required void Function()? okOnPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$txt'),
        content: Text('Are you sure you want to $txt ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: okOnPressed,
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
