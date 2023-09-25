import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'tabs/analytics_tab.dart';
import 'tabs/dashboard_tab.dart';
import 'tabs/profile_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardTab(),
    AnalyticsTab(),
    ProfileTab()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              iconSize: 24,
              elevation: 0,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: GoogleFonts.lexendDeca(
                  fontSize: 12, fontWeight: FontWeight.w500),
              selectedItemColor: Color(0xff04ECA6),
              unselectedLabelStyle: GoogleFonts.lexendDeca(
                  fontSize: 12, fontWeight: FontWeight.w500),
              unselectedItemColor: Color(0xffABAFD1),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? SvgPicture.asset(
                          "assets/icons/bolt-fill.svg",
                          colorFilter: ColorFilter.mode(
                              Color(0xff04ECA6), BlendMode.srcIn),
                        )
                      : SvgPicture.asset(
                          "assets/icons/bolt.svg",
                          colorFilter: ColorFilter.mode(
                              Color(0xffABAFD1), BlendMode.srcIn),
                        ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? SvgPicture.asset(
                          "assets/icons/graph-fill.svg",
                          colorFilter: ColorFilter.mode(
                              Color(0xff04ECA6), BlendMode.srcIn),
                        )
                      : SvgPicture.asset(
                          "assets/icons/graph.svg",
                          colorFilter: ColorFilter.mode(
                              Color(0xffABAFD1), BlendMode.srcIn),
                        ),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? SvgPicture.asset(
                          "assets/icons/user-fill.svg",
                          colorFilter: ColorFilter.mode(
                              Color(0xff04ECA6), BlendMode.srcIn),
                        )
                      : SvgPicture.asset(
                          "assets/icons/user.svg",
                          colorFilter: ColorFilter.mode(
                              Color(0xffABAFD1), BlendMode.srcIn),
                        ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
