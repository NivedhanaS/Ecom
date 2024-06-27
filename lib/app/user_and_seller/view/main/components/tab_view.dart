// ignore_for_file: must_be_immutable

import 'package:ecommerce_int2/app/user_and_seller/model/category.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';
/*import 'recommended_list.dart';*/

class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Gadgets',
      'assets/boat.png',
    ),
    Category(
      Color(0xffF68D7F),
      Color(0xffFCE183),
      'Clothes',
      'assets/jeans_3.png',
    ),
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Bags',
      'assets/bag_5.png',
    ),
    Category(
      Color(0xffF68D7F),
      Color(0xffFCE183),
      'Rings',
      'assets/ring_5.png',
    ),
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Shoes',
      'assets/shoeman_5.png',
    ),
    Category(
      Color(0xffF68D7F),
      Color(0xffFCE183),
      'Watch',
      'assets/watch_2.png',
    ),
  ];

  final TabController tabController;
  final email;
  TabView(
    this.email, {
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                              category: categories[index],
                            ))),
                SizedBox(
                  height: 10.0,
                ),
                //Flexible(child: RecommendedList(email)),
              ],
            ),
          ), /* Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList(email))
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList(email))
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList(email))
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList(email))
          ]),*/
        ]);
  }
}
