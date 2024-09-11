import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';

import '../../../../../../../core/constants/image_manager.dart';
import '../../../../../../../core/constants/routes.dart';
import '../../../../../../../core/constants/values_manager.dart';
import '../../../../../../../core/widgets/elevated_button.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../controller/auth_bloc/auth_bloc.dart';
import '../../../../../controller/auth_bloc/auth_events.dart';
import '../../../../../controller/auth_bloc/auth_states.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    late GifController gifController;
    gifController = GifController(
        onFrame: (value) => value == 24 ? gifController.pause() : null);

    context.read<AuthenticationBloc>().add(SendEmailVerficationEvent());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<AuthenticationBloc>().add(SignOutEvent()),
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
          listener: (BuildContext context, AuthenticationStates state) {
            print("state $state from verify email screen");
            if (state is AuthinticationLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is LoadedState) {
              Navigator.pop(context);
            }
            if (state is EmailVerficationSentState) {
              // Navigator.pop(context);
              if (state.email.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                  S.current.emailVerficationSent,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface
                  ),
                )
                
                ));
              }
            }
            if(state is AuthLogedOutState){
              Navigator.pushReplacementNamed(context, Routes.logIn);
            }
            if (state is AuthenticationFailedState) {
              showDialog<bool>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(S.current.error),
                    content: Text(state.errorMessage),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(S.current.ok)),
                    ],
                  );
                },
              );
            }
          },
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: GifView.asset(
                ImageManager.splash,
                controller: gifController,
                matchTextDirection: true,
                height: 300,
                width: 300,
                frameRate: 30, // default is 15 FPS
              )),
              const SizedBox(height: SizeManager.sSpace),
              Text(S.current.emailVerficationSent,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: SizeManager.sSpace),
              Text(state is EmailVerficationSentState ? state.email : "",
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SizeManager.sSpace16),
              Text(S.current.emailVerficationDescription,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SizeManager.sSpace32),
              MyElevatedButton(
                  title: S.current.done,
                  onPress: () {
                    if (FirebaseAuth.instance.currentUser!.emailVerified ==
                        true) {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.homeScreen);
                    } else {
                      Navigator.of(context).pushReplacementNamed(Routes.logIn);
                    }
                  }),
              const SizedBox(height: SizeManager.sSpace16),
              TextButton(
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(SendEmailVerficationEvent());
                  },
                  child: Text(S.current.resendEmail)),
            ],
          ),
        ),
      )),
    );
  }
}
