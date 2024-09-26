import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/components/localization/localization_service.dart';
import 'package:alubank/generated/l10n/app_localizations.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

import '../config/app_config.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BoxCard(boxContent: _RecentActivity(),),
    );
  }
}

class _RecentActivity extends StatelessWidget {
  const _RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity['spent']),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( i18n().translate('money_out', AppConfig.internalizationModeEager, context)),
                    Text('\$9907.97', style: Theme.of(context).textTheme.bodyLarge,)
                  ],
                ),
              ]
            ),
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: ColorDot(color: ThemeColors.recentActivity['income']),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(i18n().translate('money_in', AppConfig.internalizationModeEager, context)),
                      Text('\$9907.97', style: Theme.of(context).textTheme.bodyLarge,)
                    ],
                  )
                ]
            ),
          ],

        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text('${i18n().translate('expenses_limits', AppConfig.internalizationModeEager, context)}: \$432.90'),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
          ),
          child: LinearProgressIndicator(
            color: Theme.of(context).primaryColor,
            value: 0.5,
            minHeight: 8,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
          child: ContentDivision(),
        ),
        Text('Esse mês você gastou \$1500.00 com jogos. Tente abaixar esse custo!'),
        TextButton(onPressed: (){}, child: Text(i18n().translate('tell_me_how', AppConfig.internalizationModeEager, context),  style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),)),
      ],
    );
  }
}
