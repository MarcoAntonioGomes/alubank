import 'package:alubank/components/box_card.dart';
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
          child: Text(AppLocalizations.of(context)!.account_actions, style: Theme.of(context).textTheme.titleMedium,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(onTap: (){},child: BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.account_balance_wallet), text: AppLocalizations.of(context)!.deposit))),
            InkWell(onTap: (){},child: BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.cached), text: AppLocalizations.of(context)!.transfer))),
            InkWell(
                onTap: (){},child: BoxCard(boxContent: _AccountActionsContent(icon: Icon(Icons.center_focus_strong), text: AppLocalizations.of(context)!.read)))
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
