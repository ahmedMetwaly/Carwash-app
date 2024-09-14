import 'package:carwashapp/features/auth/controller/user_bloc/user_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';
import 'widgets/custom_radio_btn.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    // required this.isUpdate,
  });
  // final bool isUpdate;

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod =
      AuthenticationBloc.user.appointment!.paymentMethod ??
          ''; // Default active radio button

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomRadioButton(
              title: 'Cash',
              value: "Cash",
              groupValue: _selectedPaymentMethod!,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                  AuthenticationBloc.user.appointment?.paymentMethod = value;
                  context
                      .read<DataCubit>()
                      .updateData('screen4', _selectedPaymentMethod!);
                });
              },
            ),
            const SizedBox(height: 10),
            CustomRadioButton(
              title: 'Credit',
              value: "Credit",
              groupValue: _selectedPaymentMethod!,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                  AuthenticationBloc.user.appointment?.paymentMethod = value;
                  context
                      .read<DataCubit>()
                      .updateData('screen4', _selectedPaymentMethod!);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
