import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Widget boxContent;
  const BoxCard({super.key, required this.boxContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: boxContent,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[3],
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
