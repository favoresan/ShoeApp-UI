import 'package:flutter/material.dart';
import 'package:shoe_app/models/shoe_model.dart';

import '../../../size_config.dart';

class DetailNavBar extends StatelessWidget {
  const DetailNavBar({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ShoeModel data;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      height: defaultSize * 10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.5),
          topRight: Radius.circular(
            defaultSize * 1.5,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: defaultSize * 2.1,
            right: defaultSize * 2.1,
            top: defaultSize * 1.5,
            bottom: defaultSize * 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PRICE',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: defaultSize * 1.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: defaultSize / 2),
                  child: Text(
                    '\$${data.price.toInt()}',
                    style: TextStyle(
                        fontSize: defaultSize * 2.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              height: double.infinity,
              width: defaultSize * 18,
              child: Center(
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 10,
                    color: Colors.black12,
                  ),
                ],
                color: Colors.cyan,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    defaultSize * 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
