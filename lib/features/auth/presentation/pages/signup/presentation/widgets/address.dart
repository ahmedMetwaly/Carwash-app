import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../controller/address_cubit/address_cubit.dart';
import '../../../../../controller/address_cubit/address_states.dart';
import '../../../../../controller/auth_bloc/auth_bloc.dart';
import 'google_maps.dart';
//AIzaSyACGedVVLt24EPHBicIHijw80TxcuJ_sVs
class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController addressController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    print(AuthenticationBloc.user.address?.address);
    return BlocBuilder<AddressCubit, AddressStates>(
      builder: (BuildContext context, AddressStates state) {
         addressController.text = AuthenticationBloc.user.address!.address!;
        return TextFormField(
        controller: addressController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.current.requiredField;
          }
          return null;
        },
        readOnly: true,
        maxLines: 4,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GoogleMapPage()));
        },
        decoration: InputDecoration(
          labelText: S.current.yourAddress,
        ),
      );
      },
    );
  }
}
