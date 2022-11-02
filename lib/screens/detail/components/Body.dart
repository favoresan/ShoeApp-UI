import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoe_app/models/shoe_model.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.data}) : super(key: key);
  final ShoeModel data;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: defaultSize * 13.11),
          child: ClipPath(
            clipper: CategoryCustomShape(),
            child: Column(
              children: [
                SizedBox(
                  height: defaultSize * 67,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: defaultSize * 21,
                          ),
                          SizedBox(
                            // height: defaultSize * 30,
                            width: defaultSize * 30,
                            child: Text(
                              data.name,
                              style: TextStyle(
                                  fontSize: defaultSize * 3.2,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: defaultSize * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                maxRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: defaultSize * 2.5,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: defaultSize - 8),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) => print(
                                  rating,
                                ),
                              ),
                              SizedBox(
                                width: defaultSize * 2,
                              ),
                              Text(
                                '136 Reviews',
                                style: TextStyle(
                                    fontSize: defaultSize * 1.7,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: defaultSize * 3,
                          ),
                          Text(
                            'DETAILS',
                            style: TextStyle(
                              fontSize: defaultSize * 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: defaultSize * 1.5,
                          ),
                          Text(
                            data.desc,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: defaultSize * 1.5,
                            ),
                          ),
                          SizedBox(
                            height: defaultSize * 1.5,
                          ),
                          Text(
                            'COLOUR OPTIONS',
                            style: TextStyle(
                                fontSize: defaultSize * 2,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: defaultSize * 1.5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: defaultSize),
                                child: Container(
                                  height: defaultSize * 2.5,
                                  width: defaultSize * 2.5,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: defaultSize),
                                child: Container(
                                  height: defaultSize * 2.5,
                                  width: defaultSize * 2.5,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: defaultSize),
                                child: Container(
                                  height: defaultSize * 2.5,
                                  width: defaultSize * 2.5,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: defaultSize,
                                ),
                                child: Container(
                                  height: defaultSize * 2.5,
                                  width: defaultSize * 2.5,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 40,
          bottom: 540,
          child: Transform.rotate(
            angle: 320,
            child: Hero(
              tag: data.id,
              child: Image(
                image: AssetImage('assets/${data.imgPath}'),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 3,
          child: Container(
            height: defaultSize * 9,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: Colors.black12,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultSize * 2),
                topRight: Radius.circular(
                  defaultSize * 2,
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
                              fontSize: defaultSize * 1.9,
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
          ),
        ),
      ],
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
    double diagonalHeight = 180;

    path.moveTo(0, cornerSize * 1.5);
    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize + diagonalHeight);
    path.quadraticBezierTo(
        width, diagonalHeight, width - cornerSize, diagonalHeight * 0.91);
    path.lineTo(cornerSize * 2.6, cornerSize);
    path.quadraticBezierTo(0, 0, 0, cornerSize * 1.5);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
