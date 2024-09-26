
import 'package:alubank/generated/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class i18n {
  static final i18n _instance = i18n._internal();

  factory i18n() {
    return _instance;
  }

  Map<String, String> sentences = {};

  i18n._internal();

  Map<String, String> _localizedStrings = {};

  void loadLocalizedStrings(Map<String, dynamic> strings) {
    _localizedStrings = strings.map((key, value) => MapEntry(key, value.toString()));
  }

 void buildSentences(BuildContext context){
    if(sentences.isEmpty){
      this.sentences = {
        'balance_disponible': AppLocalizations.of(context)!.balance_disponible,
        'money_out': AppLocalizations.of(context)!.money_out,
        'money_in': AppLocalizations.of(context)!.money_in,
        'expenses_limits': AppLocalizations.of(context)!.expenses_limits,
        'tell_me_how': AppLocalizations.of(context)!.tell_me_how,
        'account_actions': AppLocalizations.of(context)!.account_actions,
        'deposit': AppLocalizations.of(context)!.deposit,
        'transfer': AppLocalizations.of(context)!.transfer,
        'read': AppLocalizations.of(context)!.read,
        'account_points': AppLocalizations.of(context)!.account_points,
        'total_points': AppLocalizations.of(context)!.total_points,
        'goal': AppLocalizations.of(context)!.goal,
        'free_delivery': AppLocalizations.of(context)!.free_delivery,
      };
    }
 }

  String translate(String key, bool isEager, BuildContext context) {


    if(isEager){
      buildSentences(context);
      return sentences[key] ?? key;
    }

    return _localizedStrings[key] ?? key; // Retorna a chave caso a tradução não exista
  }
}