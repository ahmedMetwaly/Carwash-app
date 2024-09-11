import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../../core/utils/media_query_utils.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';
import 'widgets/custom_radio_btn.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod = ""; // Default active radio button

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryUtils.getHeightPercentage(context, 0.6),
      child: Scaffold(
        body: Column(
          children: [
            CustomRadioButton(
              title: 'Cash',
              value: 'Cash',
              groupValue: _selectedPaymentMethod!,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                  AuthenticationBloc.user.appointement?.paymentMethod = value;
                  context
                      .read<DataCubit>()
                      .updateData('screen4', _selectedPaymentMethod!);
                });
              },
            ),
            const SizedBox(height: 10),
            CustomRadioButton(
              title: 'Credit',
              value: 'Credit',
              groupValue: _selectedPaymentMethod!,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                  context
                      .read<DataCubit>()
                      .updateData('screen4', _selectedPaymentMethod!);
                });
              },
            ),
            const SizedBox(height: 10),
            CustomRadioButton(
              title: 'Vodafone',
              value: 'Vodafone',
              groupValue: _selectedPaymentMethod!,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                  context
                      .read<DataCubit>()
                      .updateData('screen4', _selectedPaymentMethod!);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
