import 'package:flutter/material.dart';
import 'package:shoe_app/flutter_icons.dart';
import 'package:shoe_app/screens/detail/detail_page.dart';
import 'package:shoe_app/screens/home/components/shoe_desc.dart';
import 'package:shoe_app/size_config.dart';

import '../../../models/shoe_model.dart';
import 'clip_cont.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: defaultSize * 3.2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FlutterIcons.search,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultSize * 4,
            ),
            Container(
              // color: Colors.blue,
              height: 310,
              // width: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: shoes.length,
                itemBuilder: (context, index) => ClipContainer(
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        data: shoes[index],
                      ),
                    ),
                  ),
                  data: shoes[index],
                ),
              ),
            ),
            SizedBox(
              height: defaultSize * 3.5,
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'JUST FOR YOU',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1,
                        fontSize: defaultSize * 1.3),
                  ),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: Colors.cyan, fontSize: defaultSize * 1.2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultSize * 2.5,
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: defaultSize * 40,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: shoes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ShoeDesc(shoes: shoes[index]);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
