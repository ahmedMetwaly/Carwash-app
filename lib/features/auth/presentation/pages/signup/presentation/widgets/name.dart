import 'package:flutter/material.dart';

import '../../../../../../../generated/l10n.dart';

class Name extends StatelessWidget {
  const Name({
    super.key,
    required this.nameController,
    required this.title,
    this.readOnly,
    this.maxLines,
  });

  final TextEditingController nameController;
  final String title;
  final bool? readOnly;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      readOnly: readOnly ?? false,
      maxLines: maxLines,
      validator: (value) {
        if (readOnly == null) {
          if (value!.isEmpty) {
            return S.current.requiredField;
          } else if (value.contains("[0-9]")) {
            //print(value);
            return S.current.notValidName;
          }
        }

        return null;
      },
      style: readOnly == null
          ? Theme.of(context).textTheme.bodyMedium
          : Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.outline),
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
