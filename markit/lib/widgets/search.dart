// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:markit/helpers/common.dart';
import 'package:markit/provider/product.dart';
import 'package:markit/screens/product_search.dart';
import 'package:provider/provider.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return    Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(

          textInputAction: TextInputAction.search,
          onSubmitted: (pattern)async{
            await productProvider.search(productName: pattern);
            changeScreen(context, ProductSearchScreen());
          },
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.blueGrey[300],
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.white,),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white,),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "E.g: formal dress",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blueGrey[300],
            ),
            hintStyle: TextStyle(
              fontSize: 12.0,
              color: Colors.blueGrey[300],
            ),
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
