import 'package:ecommerce_int2/app/user_and_seller/controller/userController.dart';
import 'package:ecommerce_int2/helper/app_properties.dart';
import 'package:ecommerce_int2/app/user_and_seller/model/category.dart';
import 'package:flutter/material.dart';
import '../../../model/Seller.dart';
import '../../category/components/staggered_card2.dart';

class ShopListPage extends StatefulWidget {
  final email2;
  ShopListPage(this.email2);
  @override
  _ShopListPageState createState() => _ShopListPageState(email2);
}

class _ShopListPageState extends State<ShopListPage> {
  final email;
  _ShopListPageState(this.email);
  List<Category> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF9F9F9),
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Shops List',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: FutureBuilder(
                future: UserController.fetchAllSeller(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          Seller sellerItem = snapshot.data[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                            child: StaggeredCardCard2(email,
                                begin: Color(0xfffcd964),
                                end: Color(0xffF68D7F),
                                categoryName: sellerItem.shopName,
                                sellerId: sellerItem.id),
                          );
                        });
                  }
                  return CircularProgressIndicator.adaptive();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
