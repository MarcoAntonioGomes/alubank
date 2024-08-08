import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/sections/accountactions.dart';
import 'package:alubank/components/sections/accountpoints.dart';
import 'package:alubank/components/sections/header.dart';
import 'package:alubank/components/sections/recentactivity.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(),
          RecentActivity(),
          AccountActions(),
          AccountPoints(totalPoints: 3000,)
        ],
      ),
    ),);
  }
}
