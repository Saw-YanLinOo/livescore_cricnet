import 'package:flutter/material.dart';
import 'package:livescore/presentation/match/match_page.dart';
import 'package:livescore/presentation/new/new_page.dart';
import 'package:livescore/presentation/result_page.dart';
import 'package:livescore/presentation/upcomming_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIdx = 0;

  _onChangeNavBar(int value) {
    setState(() {
      currentIdx = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIdx,
        children: const [
          MatchPage(),
          UpcommingPage(),
          ResultPage(),
          NewPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        showSelectedLabels: true,
        selectedItemColor: Theme.of(context).indicatorColor,
        onTap: (value) => _onChangeNavBar(value),
        currentIndex: currentIdx,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined), label: "Matches"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: "Uppcoming"),
          BottomNavigationBarItem(
              icon: Icon(Icons.restart_alt), label: "Results"),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded), label: "News"),
        ],
      ),
    );
  }
}
