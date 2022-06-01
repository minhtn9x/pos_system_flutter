import 'package:flutter/material.dart';
import 'package:restaurant_pos/util/milktea.dart';
import 'package:restaurant_pos/widgets/badge.dart';
import 'package:restaurant_pos/widgets/grid_product.dart';


class MilkteasScreen extends StatefulWidget {
  @override
  _MilkteasScreenState createState() => _MilkteasScreenState();
}

class _MilkteasScreenState extends State<MilkteasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Milk tea",
        ),
        elevation: 0.0,
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(

          children: <Widget>[
            Divider(),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: milkteas == null ? 0 :milkteas.length,
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

            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
