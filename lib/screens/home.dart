import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:restaurant_pos/screens/drinks.dart';
import 'package:restaurant_pos/screens/pizzas.dart';
import 'package:restaurant_pos/util/pizzas.dart';
import 'package:restaurant_pos/widgets/grid_product.dart';
import 'package:restaurant_pos/widgets/home_category.dart';
import 'package:restaurant_pos/util/categories.dart';
import 'package:restaurant_pos/widgets/product.dart';

import '../util/drinks.dart';
import '../util/milktea.dart';
import 'milkteas.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

  class Product {
    String id;
    List<Values> values;

    Product({this.id, this.values});

    Product.fromJson(Map<String, dynamic> json) {
      id = json['\$id'];
      if (json['\$values'] != null) {
        values = [];
        json['\$values'].forEach((v) {
          values.add(new Values.fromJson(v));
        });
      }
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['\$id'] = this.id;
      if (this.values != null) {
        data['\$values'] = this.values.map((v) => v.toJson()).toList();
      }
      return data;
    }
  }

  class Values {
    String id;
    String code;
    String productName;
    String shortName;
    int price;
    String picUrl;
    int catId;
    bool isAvailable;
    int discountPercent;
    int discountPrice;
    int productType;

    Values(
        {this.id,
          this.code,
          this.productName,
          this.shortName,
          this.price,
          this.picUrl,
          this.catId,
          this.isAvailable,
          this.discountPercent,
          this.discountPrice,
          this.productType});

    Values.fromJson(Map<String, dynamic> json) {
      id = json['\$id'];
      code = json['code'];
      productName = json['productName'];
      shortName = json['shortName'];
      price = json['price'];
      picUrl = json['picUrl'];
      catId = json['catId'];
      isAvailable = json['isAvailable'];
      discountPercent = json['discountPercent'];
      discountPrice = json['discountPrice'];
      productType = json['productType'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['\$id'] = this.id;
      data['code'] = this.code;
      data['productName'] = this.productName;
      data['shortName'] = this.shortName;
      data['price'] = this.price;
      data['picUrl'] = this.picUrl;
      data['catId'] = this.catId;
      data['isAvailable'] = this.isAvailable;
      data['discountPercent'] = this.discountPercent;
      data['discountPrice'] = this.discountPrice;
      data['productType'] = this.productType;
      return data;
    }
  }


class NetworkRequest{

  static List<Values> parseProduct(String responseBody){
    var list = json.decode(responseBody) as Map<String, dynamic>;
    List<Values> cats = Product.fromJson(list).values;
    return cats;
  }

  static Future<List<Values>> fetchProduct() async {
    final response = await http
          .get(Uri.parse('https://10.0.2.2:5001/api/product'));
    if (response.statusCode == 200) {
      return compute(parseProduct, response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }
}


class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{

  // Future<Product> futureProduct;
  // List<T> map<T>(List list, Function handler) {
  //   List<T> result = [];
  //   for (var i = 0; i < list.length; i++) {
  //     result.add(handler(i, list[i]));
  //   }
  //
  //   return result;
  // }

  //List<Values> cats = List();

  @override
  void initState() {
    super.initState();
    // NetworkRequest.fetchProduct().then((dataFromServer){
    //   setState((){
    //     cats = dataFromServer;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),

        child: ListView(

          children: <Widget>[
            Text(
              "Food and Drink Categories",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20.0),

            Container(
                height: 65.0,
              // child: FutureBuilder<List<Values>>(
              //   future: NetworkRequest.fetchProduct(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       debugPrint('fetch product success');
              //       final products = snapshot.data;
              //       return ListView.builder(
              //         itemCount: products.length,
              //         itemBuilder: (context, index){
              //           return Card(
              //             child: Padding(
              //               padding: EdgeInsets.all(10),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('${products[index].productName}'),
              //                 ],
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     } else if (snapshot.hasError) {
              //       return Text('${snapshot.error}');
              //     }
              //
              //     // By default, show a loading spinner.
              //     return const CircularProgressIndicator();
              //   },
              // ),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null?0:categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];
                  return HomeCategory(
                    icon: cat['icon'],
                    title: cat['name'],
                    items: cat['items'].toString(),
                    isHome: true,
                  );
                },
              ),

            ),

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text(
                  "Milk Tea",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),

                TextButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return MilkteasScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 2,
              //itemCount: milkteas == null ? 0 :milkteas.length,
              itemBuilder: (BuildContext context, int index) {
                Map milktea = milkteas[index];
                return GridProduct(
                  img: milktea['img'],
                  isFav: false,
                  name: milktea['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),

            SizedBox(height: 15),
            Divider(),
            Divider(),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Drinks",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),

                TextButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return DrinksScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                Map drink = drinks[index];
                return GridProduct(
                  img: drink['img'],
                  isFav: false,
                  name: drink['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),

            SizedBox(height: 15),
            Divider(),
            Divider(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Pizza",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),

                TextButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return PizzasScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                Map pizza = pizzas[index];
                return GridProduct(
                  img: pizza['img'],
                  isFav: false,
                  name: pizza['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
