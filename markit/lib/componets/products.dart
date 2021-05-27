// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:markit/models/product.dart';
import 'package:markit/widgets/loading.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Products extends StatefulWidget {
  final List<ProductModel> product;

  const Products({Key key, this.product}) : super(key: key);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //Products(List<>)
  // var product_list = [
  //   {
  //     "name": "Blazer",
  //     "picture": "assets/images/products/blazer1.jpeg",
  //     "old_price": 120,
  //     "price": 85,
  //   },
  //   {
  //     "name": "Red dress",
  //     "picture": "assets/images/products/dress1.jpeg",
  //     "old_price": 100,
  //     "price": 50,
  //   },
  //   {
  //     "name": "Red dress",
  //     "picture": "assets/images/products/dress1.jpeg",
  //     "old_price": 100,
  //     "price": 50,
  //   },
  //   {
  //     "name": "Red dress",
  //     "picture": "assets/images/products/dress1.jpeg",
  //     "old_price": 100,
  //     "price": 50,
  //   },
  //   {
  //     "name": "Red dress",
  //     "picture": "assets/images/products/dress1.jpeg",
  //     "old_price": 100,
  //     "price": 50,
  //   },
  //   {
  //     "name": "Red dress",
  //     "picture": "assets/images/products/dress1.jpeg",
  //     "old_price": 100,
  //     "price": 50,
  //   },
  //   {
  //     "name": "Red dress",
  //     "picture": "assets/images/products/dress1.jpeg",
  //     "old_price": 100,
  //     "price": 50,
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap:true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: widget.product.length,
        gridDelegate:
        new SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        //SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: widget.product[index].name,
              prod_pricture: widget.product[index].picture,
              prod_price: widget.product[index].price,
            ),
          );
        });

    // return new StaggeredGridView.countBuilder(
    //   shrinkWrap:true,
    //   crossAxisCount: 4,
    //   physics: new NeverScrollableScrollPhysics(),
    //   itemCount: widget.product.length,
    //   itemBuilder: (BuildContext context, int index) => new Container(
    //       color: Colors.green,
    //       child:Padding(
    //         padding: const EdgeInsets.all(4.0),
    //         child: Single_prod(
    //           prod_name: widget.product[index].name,
    //           prod_pricture: widget.product[index].picture,
    //           prod_price: widget.product[index].price,
    //         ),
    //   )),
    //   staggeredTileBuilder: (int index) =>
    //   new StaggeredTile.count(2, index.isEven ? 2 : 1),
    //   mainAxisSpacing: 4.0,
    //   crossAxisSpacing: 4.0,
    // );


  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Loading(),
                          )),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: prod_pricture,
                      ),
                      // Image.asset(
                      //   prod_pricture,
                      //   fit: BoxFit.cover,
                      // ),

                    ],

                  ),
                  Text(
                    prod_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$$prod_price",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
class Example07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('dynamic tile sizes'),
      ),
      body: new StaggeredGridView.count(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        children: <Widget>[
          new _Tile(
              'https://cdn.pixabay.com/photo/2013/04/07/21/30/croissant-101636_960_720.jpg',
              1),
          new _Tile(
              'https://cdn.pixabay.com/photo/2016/01/22/16/42/eiffel-tower-1156146_960_720.jpg',
              2),
          new _Tile(
              'https://cdn.pixabay.com/photo/2016/10/22/20/34/two-types-of-wine-1761613_960_720.jpg',
              3),
          new _Tile(
              'https://cdn.pixabay.com/photo/2016/10/21/14/50/plouzane-1758197_960_720.jpg',
              4),
          new _Tile(
              'https://cdn.pixabay.com/photo/2016/11/16/10/59/mountains-1828596_960_720.jpg',
              5),
          new _Tile(
              'https://cdn.pixabay.com/photo/2013/04/13/18/42/the-eiffel-tower-103417_960_720.jpg',
              6),
          new _Tile(
              'https://cdn.pixabay.com/photo/2017/08/24/22/37/gyrfalcon-2678684_960_720.jpg',
              7),
          new _Tile(
              'https://cdn.pixabay.com/photo/2013/01/17/08/25/sunset-75159_960_720.jpg',
              8),
        ],
        staggeredTiles: const <StaggeredTile>[
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(1),
          const StaggeredTile.fit(3),
          const StaggeredTile.fit(3),
          const StaggeredTile.fit(1),
          const StaggeredTile.fit(2),
          const StaggeredTile.fit(2),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.source, this.index);

  final String source;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Image.network(source),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  'Image number $index',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  'Vincent Van Gogh',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

