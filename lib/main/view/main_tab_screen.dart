// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foseja/common/const/colors.dart';
import 'package:foseja/main/view/setting_screen.dart';

class MainTabScreen extends ConsumerStatefulWidget {
  const MainTabScreen({super.key});

  @override
  MainTabScreenState createState() => MainTabScreenState();
}

class MainTabScreenState extends ConsumerState<MainTabScreen> {
  int _selectedIdx = 0;
  final screens = [
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Title(),
          SizedBox(
            height: 20,
          ),
          _SubTitle(),
        ],
      ),
    ),
    const Center(
      child: Text('DASHBOARD'),
    ),
    const Center(
      child: Text('MY INFO'),
    ),
    const SettingScreen(),
  ];

  void _onTap(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIdx],
      backgroundColor: BACKGROUND_COLOR,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIdx,
        onTap: _onTap,
        backgroundColor: BACKGROUND_COLOR,
        selectedItemColor: DEFAULT_TEXT_COLOR,
        unselectedItemColor: DEFAULT_TEXT_COLOR,
        items: [
          BottomNavigationBarItem(
            backgroundColor: BACKGROUND_COLOR,
            label: 'HOME',
            icon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              color: DEFAULT_TEXT_COLOR,
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: BACKGROUND_COLOR,
            label: 'DASHBOARD',
            icon: SvgPicture.asset(
              'assets/icons/chart_icon.svg',
              color: DEFAULT_TEXT_COLOR,
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: BACKGROUND_COLOR,
            label: 'MY INFO',
            icon: SvgPicture.asset(
              'assets/icons/user_info_icon.svg',
              color: DEFAULT_TEXT_COLOR,
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: BACKGROUND_COLOR,
            label: 'SETTING',
            icon: SvgPicture.asset(
              'assets/icons/gear_icon.svg',
              color: DEFAULT_TEXT_COLOR,
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'foseja',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: DEFAULT_TEXT_COLOR,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      ':-)',
      style: TextStyle(
        fontSize: 20,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
