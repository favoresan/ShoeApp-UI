import 'package:flutter/material.dart';
import 'package:shoe_app/const.dart';
import 'package:shoe_app/flutter_icons.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/nav_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
      ),
      body: Body(),
    );
  }
}
