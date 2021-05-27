import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:markit/models/product.dart';
import 'package:markit/widgets/loading.dart';
import 'package:transparent_image/transparent_image.dart';


class ProductsGrid extends StatelessWidget {
  ProductsGrid({this.product});

  final List<ProductModel> product;

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        itemCount: product.length,
        shrinkWrap:true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) => new _Tile(product[index]),
        staggeredTileBuilder: (index) => new StaggeredTile.fit(MediaQuery.of(context).orientation == Orientation.landscape ? 1 : 2),

    );
  }
}



class _Tile extends StatelessWidget {
  const _Tile(this.p);

  final ProductModel p;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Loading(),
                  )),
              //new Center(child: new CircularProgressIndicator()),
              new Center(
                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: p.picture,
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  p.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  'Rwf: ${p.price}',
                  style: const TextStyle(color: Colors.grey),
                ),
                new Text(
                  'brand: ${p.brand}',
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
