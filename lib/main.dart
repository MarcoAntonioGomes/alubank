import 'package:alubank/components/config/app_config.dart';
import 'package:alubank/components/localization/locale_resolver.dart';
import 'package:alubank/components/localization/localizarion_loader.dart';
import 'package:alubank/generated/l10n/app_localizations.dart';
import 'package:alubank/screens/home.dart';
import 'package:alubank/themes/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Alubank());
}

class Alubank extends StatelessWidget {
 Alubank({super.key});
  final Locale? _locale = Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return loadAppWithLanguageSupport(AppConfig.internalizationModeEager);
  }

 Widget loadAppWithLanguageSupport(bool isEagerLoading){

    if(isEagerLoading){
      return  MaterialApp(
        locale: _locale ,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          if (_locale != null) {
            return _locale;
          }
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        title: 'Alubank',
        theme: MyTheme,
        home: Home(),
      );

    }else{
      return  MaterialApp(
        locale: _locale ,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          if (_locale != null) {
            return _locale;
          }
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        title: 'Alubank',
        theme: MyTheme,
        home: LocalizationLoader(locale: LocaleResolver().resolve(_locale!.languageCode)),
      );

    }

 }

}


