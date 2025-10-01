import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoreup_cubit/auth/cubit/auth_cubit.dart';
import 'package:scoreup_cubit/auth/screen/login_page.dart';
import 'package:scoreup_cubit/auth/screen/otp_page.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/accountCubit/account_cubit.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/boostscoreCubit/boostscore_cubit.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/creditReportcubit/credit_report_cubit.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/homeCubit/home_cubit.dart';
import 'package:scoreup_cubit/root_home.dart';
import 'package:scoreup_cubit/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        BlocProvider<CreditReportCubit>(create: (context) => CreditReportCubit()),
        BlocProvider<AccountCubit>(create: (context) => AccountCubit()),
        BlocProvider<BoostscoreCubit>(create: (context) => BoostscoreCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale('en')],
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => Splashscreen());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginPage());
            case '/otp':
              final args = settings.arguments as Map<String, dynamic>;
              final mobile = args['mobileNumber'] as String;
              return MaterialPageRoute(builder: (_) => OtpPage(mobile: mobile));
            case '/roothome':
              return MaterialPageRoute(builder: (_) => RootHome());
          }
        },
      ),
    );
  }
}
