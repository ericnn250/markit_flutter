import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:markit/componets/horizontal_listview.dart';
import 'package:markit/componets/products.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Markit'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){})
        ],
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Ngendahimana Eric'),
                accountEmail: Text('yes1ericn@gmail.com'),
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
                onTap: (){},
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
                onTap: (){},
                child: ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.logout),
                ),
              ),
            ],
          )

      ) ,
      body: ListView(
        children:<Widget> [
          //carousel begin
          image_carousel,
          //categories
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories'),) ,
          //Horizantal ListView
          HorizontalList(),
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Recent products')),),

          //grid view
          Container(
              height: 320,
              child: Products()),

        ],
      ),
    );
  }
}
