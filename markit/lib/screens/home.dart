// TODO Implement this library.
import 'package:carousel_pro/carousel_pro.dart';
import 'package:markit/componets/products.dart';
import 'package:markit/helpers/common.dart';
import 'package:markit/helpers/style.dart';
import 'package:markit/provider/product.dart';
import 'package:markit/provider/user.dart';
import 'package:markit/screens/product_search.dart';
import 'package:markit/services/product.dart';
import 'package:markit/widgets/categories_section.dart';
import 'package:markit/widgets/custom_text.dart';
import 'package:markit/widgets/featured_products.dart';
import 'package:markit/widgets/grid_product_view.dart';
import 'package:markit/widgets/product_card.dart';
import 'package:markit/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'order.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  ProductServices _productServices = ProductServices();
  bool _showsearch=false;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    List<String> category_list = ["All", "Shirt", "Dress", "Shoes","Computers","Phones", "Watches", "Hats"];

    Widget image_carousel= Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/m2.jpg'),
          AssetImage('assets/images/back.jpg'),
          AssetImage('assets/images/w1.jpeg'),
          AssetImage('assets/images/w4.jpeg'),
          AssetImage('assets/images/w3.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    //bool showsearch=false;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Markit'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: () { setState(() {_showsearch = true;});}),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){changeScreen(context, CartScreen());})
        ],
      ),
      //backgroundColor: white,
      drawer:  Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(userProvider.userModel?.name ?? "username loading..."),
                accountEmail: Text(userProvider.userModel?.email ?? "email loading...",),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person,color: Colors.white,),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My Account'),
                  leading: Icon(Icons.person),
                ),
              ),
              InkWell(
                onTap: () async {
                  await userProvider.getOrders();
                  changeScreen(context, OrdersScreen());
                },
                child: ListTile(
                  title: Text('My Orders'),
                  leading: Icon(Icons.shopping_basket_rounded),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Categories'),
                  leading: Icon(Icons.dashboard),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Favorites'),
                  leading: Icon(Icons.favorite),
                ),
              ),
              Divider(),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Help'),
                  leading: Icon(Icons.help),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.info),
                ),
              ),
              InkWell(
                onTap: (){userProvider.signOut();},
                child: ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.logout),
                ),
              ),
            ],
          )

      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//           Custom App bar

//          Search Text field
           _showsearch ? Search() :Container(),
            //Search(),
            image_carousel,
//            featured products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Featured products')),
                ),
              ],
            ),
            FeaturedProducts(),
            SizedBox(height: 10,),
//          recent products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Recent products')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text('View All'),
                  ),
                )
              ],
            ),
          SizedBox(height: 10,),
            // Column(
            //   children: productProvider.products
            //       .map((item) => GestureDetector(
            //     child: ProductCard(
            //       product: item,
            //     ),
            //   ))
            //       .toList(),
            // )
            Container(
              child: ProductsGrid(product:productProvider.products),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Categories')),
            ),
            SizedBox(height: 10,),
            Categories(product:productProvider.products,category_list:category_list)
          ],
        ),
      ),
    );
  }
}
//Row(
//mainAxisAlignment: MainAxisAlignment.end,
//children: <Widget>[
//GestureDetector(
//onTap: (){
//key.currentState.openDrawer();
//},
//child: Icon(Icons.menu))
//],
//),
