import "package:flutter/material.dart";

import "../../../../../../../core/constants/colors_manager.dart";
import "../../../../../../../generated/l10n.dart";

class Passsword extends StatefulWidget {
  const Passsword({
    super.key,
    required this.inputController,
    required this.insideSignInPage,
  });
  final TextEditingController inputController;
  final bool insideSignInPage;
  @override
  State<Passsword> createState() => _PassswordState();
}

class _PassswordState extends State<Passsword> {
  bool showPass = true;
  RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double passwordStrength = 0;
  bool validatePassword(String pass) {
    String password = pass.trim();
    if (password.isEmpty) {
      setState(() {
        passwordStrength = 0;
      });
    } else if (password.length < 6) {
      setState(() {
        passwordStrength = 1 / 4;
      });
    } else if (password.length < 8) {
      setState(() {
        passwordStrength = 2 / 4;
      });
    } else {
      if (passValid.hasMatch(password)) {
        setState(() {
          passwordStrength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          passwordStrength = 3 / 4;
        });
        print(passwordStrength);
        return false;
      }
    }
    print(passwordStrength);

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        controller: widget.inputController,
        keyboardType: TextInputType.visiblePassword,
        style: Theme.of(context).textTheme.bodyMedium,
        onChanged: (value) => validatePassword(value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.current.requiredField;
          } else {
            if (true) {
              bool result = validatePassword(value);
              if (result) {
                return null;
              } else {
                if (widget.insideSignInPage == false) {
                  return S.current.passErrorSignUp;
                }
              }
            }
          }
          return null;
        },
        obscureText: showPass,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPass = !showPass;
                });
              },
              icon: Icon(showPass
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded)),
          labelText: S.current.password,
        ),
      ),
      widget.insideSignInPage
          ? const SizedBox()
          : LinearProgressIndicator(
              value: passwordStrength,
              backgroundColor: Theme.of(context).colorScheme.outline,
              minHeight: 5,
              color: passwordStrength <= 1 / 4
                  ? Theme.of(context).colorScheme.error
                  : passwordStrength == 2 / 4
                      ? ColorsManager.yeloow
                      : passwordStrength == 3 / 4
                          ? ColorsManager.blue
                          : ColorsManager.success,
            ),
    ]);
  }
}
