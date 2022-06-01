import 'package:flutter/material.dart';
import 'package:restaurant_pos/util/drinks.dart';
import 'package:restaurant_pos/widgets/grid_product.dart';


class DrinksScreen extends StatefulWidget {
  @override
  _DrinksScreenState createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
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
          "Drinks",
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
              itemCount: drinks == null ? 0 :drinks.length,
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

            SizedBox(height: 20.0),

            Divider(),
          ],
        ),
      ),
    );
  }
}
