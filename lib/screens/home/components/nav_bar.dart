import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../const.dart';
import '../../../flutter_icons.dart';
import '../../../size_config.dart';

int index = 0;
final barProvider = StateProvider((ref) => index);

class NavBar extends ConsumerWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double defaultSize = SizeConfig.defaultSize;
    final navBar = ref.watch(barProvider);
    return Container(
      height: defaultSize * 8.96,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // offset: Offset(0, 10),
            blurRadius: defaultSize,
            spreadRadius: 1,
            color: Colors.black12,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(defaultSize * 3),
          topLeft: Radius.circular(defaultSize * 3),
        ),
      ),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.greenColor,
        unselectedItemColor: Colors.black26,
        currentIndex: navBar,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    ref.read(barProvider.notifier).state = 0;
                  },
                  child: Icon(FlutterIcons.compass)),
              label: ''),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    ref.read(barProvider.notifier).state = 1;
                  },
                  child: Icon(FlutterIcons.list)),
              label: ''),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    ref.read(barProvider.notifier).state = 2;
                  },
                  child: Icon(FlutterIcons.bag)),
              label: ''),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    ref.read(barProvider.notifier).state = 3;
                  },
                  child: Icon(FlutterIcons.person_outline)),
              label: ''),
        ],
      ),
    );
  }
}
