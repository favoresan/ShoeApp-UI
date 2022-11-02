import 'package:flutter/material.dart';
import 'package:shoe_app/flutter_icons.dart';

import '../../../models/shoe_model.dart';
import '../../../size_config.dart';
import 'dart:math' as math;

class ClipContainer extends StatelessWidget {
  const ClipContainer({
    Key? key,
    required this.data,
    required this.press,
  }) : super(key: key);
  final ShoeModel data;
  final Function press;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return GestureDetector(
      onTap: () => press(),
      child: Padding(
        padding: EdgeInsets.only(right: defaultSize * 1.6),
        child: Stack(
          children: [
            ClipPath(
              clipper: CategoryCustomShape(),
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 50),
                color: data.color,
                // height: 300,
                width: defaultSize * 23,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: defaultSize * 4, left: defaultSize * 1.5),
                      child: Icon(
                        data.brand == 'Nike'
                            ? FlutterIcons.nike
                            : FlutterIcons.converse,
                        color: Colors.white,
                        size: defaultSize * 3,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: EdgeInsets.only(
                        left: defaultSize * 1.5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: defaultSize * 13.7,
                            child: Text(
                              data.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: defaultSize * 1.8,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: defaultSize,
                          ),
                          Text(
                            '\$${data.price.toInt()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: defaultSize * 2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(defaultSize * 1),
                          ),
                          color: Colors.cyan,
                        ),
                        height: defaultSize * 5,
                        width: defaultSize * 5,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 9,
              left: 0,
              // top: 20,
              bottom: 135,
              child: Transform.rotate(
                angle: -math.pi / 7,
                child: Hero(
                  tag: data.id,
                  child: Image(
                    height: defaultSize * 20,
                    width: defaultSize * 20,
                    image: AssetImage(
                      'assets/${data.imgPath}',
                      //),
                    ),
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

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 25;
    double diagonalHeight = 100;

    path.moveTo(0, cornerSize * 1.5);
    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize + diagonalHeight);
    path.quadraticBezierTo(
        width, diagonalHeight, width - cornerSize, diagonalHeight * 0.9);
    path.lineTo(cornerSize * 2, cornerSize);
    path.quadraticBezierTo(0, 0, 0, cornerSize * 1.5);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
