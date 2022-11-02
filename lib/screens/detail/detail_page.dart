import 'package:flutter/material.dart';
import 'components/Body.dart';
import '../../models/shoe_model.dart';
import 'components/detail_nav_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.data}) : super(key: key);
  final ShoeModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: DetailNavBar(
      //   data: data,
      // ),
      backgroundColor: data.color,
      appBar: AppBar(
        title: Text(
          'CATEGORIES',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: data.color,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Body(
        data: data,
      ),
    );
  }
}
