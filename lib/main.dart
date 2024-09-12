import 'package:carwashapp/core/Functions/update_cubit_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/router.dart';
import 'core/constants/routes.dart';
import 'core/constants/stripe_keys.dart';
import 'core/constants/theme_manager.dart';
import 'features/auth/controller/address_cubit/address_cubit.dart';
import 'features/auth/controller/auth_bloc/auth_bloc.dart';
import 'features/auth/controller/auth_bloc/auth_events.dart';
import 'features/auth/controller/shared_pref_bloc/sharedpref_bloc.dart';
import 'features/auth/controller/shared_pref_bloc/sharedpref_state.dart';
import 'features/auth/controller/user_bloc/user_bloc.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
Stripe.publishableKey = StripeKeys.publishableKey;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAppCheck.instance.activate(); // Ensure activation.

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SharedPrefBloc()..appStarted(),
      lazy: false,
    ),
    BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      lazy: false,
    ),
    BlocProvider(create: (context) => UserBloc()),
    BlocProvider(create: (context) => AddressCubit()),
    BlocProvider(create: (context) => DataCubit()),
   
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefBloc, SettingsStates>(
      builder: (BuildContext context, SettingsStates state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(context.read<SharedPrefBloc>().lang),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'carwash',
        theme: ThemeManager.lightTheme,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: (settings) => RoutesGeneratour.getRoute(settings),
      ),
    );
  }
}
