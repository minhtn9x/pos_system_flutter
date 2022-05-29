import 'package:flutter/material.dart';
import 'package:restaurant_pos/util/pizzas.dart';
import 'package:restaurant_pos/widgets/badge.dart';
import 'package:restaurant_pos/widgets/grid_product.dart';


class PizzasScreen extends StatefulWidget {
  @override
  _PizzasScreenState createState() => _PizzasScreenState();
}

class _PizzasScreenState extends State<PizzasScreen> {
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
          "Pizza",
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
              itemCount: 4,
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

            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
