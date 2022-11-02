import 'package:flutter/material.dart';

import '../../../models/shoe_model.dart';
import '../../../size_config.dart';

class ShoeDesc extends StatelessWidget {
  const ShoeDesc({
    Key? key,
    required this.shoes,
    // required this.img,
    // required this.topText,
    // required this.text,
    // required this.price,
  }) : super(key: key);
  // final String img, topText, text, price;
  final ShoeModel shoes;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.only(bottom: defaultSize),
      child: Container(
        height: defaultSize * 10,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  // offset: Offset(0, 10),
                  spreadRadius: 1,
                  blurRadius: defaultSize * 1,
                  color: Colors.black12)
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(
                defaultSize * 2.5,
              ),
            ),
            color: Colors.white),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: defaultSize * 1.5, right: defaultSize * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/${shoes.imgPath}'),
                ),
                SizedBox(
                  width: defaultSize,
                ),
                Padding(
                  padding: EdgeInsets.only(top: defaultSize * 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: defaultSize * 16,
                        child: Text(
                          shoes.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: defaultSize * 1.5),
                        ),
                      ),
                      SizedBox(
                        height: defaultSize / 2,
                      ),
                      Text(
                        shoes.brand,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: defaultSize * 1.5,
                ),
                Text(
                  '\$${shoes.price.toInt()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: defaultSize * 1.7),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
