import "package:flutter/material.dart";

import "../../../../../../../core/constants/colors_manager.dart";
import "../../../../../../../generated/l10n.dart";

class Email extends StatefulWidget {
  const Email({
    super.key,
    required this.inputController,
  });
  final TextEditingController inputController;
  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    IconData emailChecker = Icons.email_rounded;

    return TextFormField(
      controller: widget.inputController,
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) => validateEmail(value),
      decoration: InputDecoration(
        suffixIcon: Icon(emailChecker, color: ColorsManager.grey),
        labelText: S.current.email,
      ),
    );
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return S.current.requiredField;
    } else if (!regex.hasMatch(value)) {
      return S.current.notValidEmail;
    }
    return null;
  }
}
