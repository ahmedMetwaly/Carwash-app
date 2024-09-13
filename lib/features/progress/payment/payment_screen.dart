import 'package:carwashapp/features/auth/controller/user_bloc/user_bloc.dart';
import 'package:carwashapp/features/auth/controller/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Functions/update_cubit_functions.dart';
import '../../../core/utils/media_query_utils.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';
import 'widgets/custom_radio_btn.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.isUpdate = false});
  final bool isUpdate;

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
        return SizedBox(
          height: MediaQueryUtils.getHeightPercentage(context, 0.6),
          child: Scaffold(
              body: widget.isUpdate &&
                      AuthenticationBloc.user.appointment!.paymentMethod ==
                          "Credit"
                  ? CustomRadioButton(
                      title: 'Credit',
                      value: "Credit",
                      groupValue: _selectedPaymentMethod!,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                          AuthenticationBloc.user.appointment?.paymentMethod =
                              value;
                        });
                      },
                    )
                  : Column(
                      children: [
                        AuthenticationBloc.user.appointment!.paymentMethod ==
                                "Credit"
                            ? const SizedBox.shrink()
                            : CustomRadioButton(
                                title: 'Cash',
                                value: "Cash",
                                groupValue: _selectedPaymentMethod!,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedPaymentMethod = value;
                                    AuthenticationBloc.user.appointment
                                        ?.paymentMethod = value;
                                    context.read<DataCubit>().updateData(
                                        'screen4', _selectedPaymentMethod!);
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
                              AuthenticationBloc
                                  .user.appointment?.paymentMethod = value;
                              //aaaahhhhhhhhhmmmeeeeeeeeddd
                              // context.read<UserBloc>().add(event)

                              context.read<DataCubit>().updateData(
                                  'screen4', _selectedPaymentMethod!);
                            });
                          },
                        ),
                      ],
                    )),
        );
      },
    );
  }
}
