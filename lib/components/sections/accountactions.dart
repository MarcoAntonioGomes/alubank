import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/config/app_config.dart';
import 'package:alubank/components/localization/localization_service.dart';
import 'package:alubank/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(16), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(i18n().translate('account_actions', AppConfig.internalizationModeEager, context), style: Theme.of(context).textTheme.titleMedium,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(onTap: (){},child: BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.account_balance_wallet), text: i18n().translate('deposit', AppConfig.internalizationModeEager, context)))),
            InkWell(onTap: (){},child: BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.cached), text: i18n().translate('transfer',AppConfig.internalizationModeEager, context)))),
            InkWell(
                onTap: (){},child: BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.center_focus_strong), text: i18n().translate('read', AppConfig.internalizationModeEager, context))))
          ],
        )
      ],
    ));
  }
}


class _AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;
  const _AccountActionsContent({super.key, required this.icon, required this.text});


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: icon,
          ),
          Text(text)
        ],
      ),
    );
  }
}
