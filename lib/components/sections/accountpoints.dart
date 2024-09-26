

import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/config/app_config.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/components/localization/localization_service.dart';
import 'package:alubank/generated/l10n/app_localizations.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class AccountPoints extends StatelessWidget {
  final int totalPoints;
  const AccountPoints({super.key, required this.totalPoints});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              AppLocalizations.of(context)!.account_points,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          BoxCard(
              boxContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(i18n().translate('total_points', AppConfig.internalizationModeEager, context)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '$totalPoints',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const ContentDivision(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Text(
                      i18n().translate('goal', AppConfig.internalizationModeEager, context),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  _AccountPointsContent(dot: ThemeColors.recentActivity['red'], text: '${i18n().translate('free_delivery',AppConfig.internalizationModeEager, context)}:1500'),
                  _AccountPointsContent(dot: ThemeColors.recentActivity['dark-purple'], text: '${i18n().translate('free_delivery', AppConfig.internalizationModeEager, context)}: 1500'),
                ],
              ))
        ],
      ),
    );
  }
}

class _AccountPointsContent extends StatelessWidget {
  final Color? dot;
  final String text;
  const _AccountPointsContent(
      {super.key, required this.dot, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ColorDot(color: dot),
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}