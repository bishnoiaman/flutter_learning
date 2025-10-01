import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoreup_cubit/dashboard/screens/Account/account_page.dart';
import 'package:scoreup_cubit/dashboard/screens/Home/home_page.dart';
import 'package:scoreup_cubit/dashboard/screens/boostScore/boostscore_page.dart';
import 'package:scoreup_cubit/dashboard/screens/creditReport/creditreport_page.dart';
import 'package:scoreup_cubit/resources/svg/app_svg.dart';

class RootHome extends StatefulWidget {
  const RootHome({super.key});

  @override
  State<RootHome> createState() => _RootHomeState();
}

class _RootHomeState extends State<RootHome> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    CreditreportPage(),
    BoostScorePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1, thickness: 0.5),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  AppIconSvg.homeIcon,
                  color: Colors.grey,
                ),
                label: "Home",
                activeIcon: SvgPicture.string(
                  AppIconSvg.homeIcon,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  AppIconSvg.creditReportIcon,
                  color: Colors.grey,
                ),
                label: "Credit Report",
                activeIcon: SvgPicture.string(
                  AppIconSvg.creditReportIcon,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  AppIconSvg.boostScoreIcon,
                  color: Colors.grey,
                ),
                label: "Boost Score",
                activeIcon: SvgPicture.string(
                  AppIconSvg.boostScoreIcon,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.string(
                  AppIconSvg.acocuntIcon,
                  color: Colors.grey,
                ),
                label: "Account",
                activeIcon: SvgPicture.string(
                  AppIconSvg.acocuntIcon,
                  color: Colors.blue,
                ),
              ),
            ],
            currentIndex: currentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromARGB(255, 3, 138, 249),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
