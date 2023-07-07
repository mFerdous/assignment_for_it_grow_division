import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/dependency/dependency.dart';
import 'core/navigation/route_config.dart';
import 'core/resources/string_res.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/lang/app_localizations.dart';
import 'features/common/presentation/cubit/locale/locale_cubit.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final routeConfig = RouteConfig();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Dependency.providers, //_getCubitList(),
      child: _buildMaterialApp(),
    );
  }

  BlocBuilder<LocaleCubit, LocaleState> _buildMaterialApp() {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routeConfig.routes,
          supportedLocales: _supportedLocale,
          localizationsDelegates: _localizationDelegates,
          localeResolutionCallback: localeResolution,
          locale: state.getCurrentLocale(),
          builder: EasyLoading.init(),
          theme: ThemeData(
              // unselectedWidgetColor: Colors.red,
              ),
        );
      },
    );
  }

  final _supportedLocale = [
    const Locale(StringRes.kLangCodeEN, StringRes.kLangCountryUS),
    const Locale(StringRes.kLangCodeBN, StringRes.kLangCountryBD),
  ];

  final _localizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  Locale localeResolution(locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
