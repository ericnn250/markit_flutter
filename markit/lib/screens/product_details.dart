// TODO Implement this library.

import 'package:fluttertoast/fluttertoast.dart';
import 'package:markit/admin/providers/products_provider.dart';
import 'package:markit/helpers/common.dart';
import 'package:markit/helpers/style.dart';
import 'package:markit/models/product.dart';
import 'package:markit/provider/app.dart';
import 'package:markit/provider/user.dart';
import 'package:markit/screens/cart.dart';
import 'package:markit/screens/single_product_img.dart';
import 'package:markit/widgets/custom_text.dart';
import 'package:markit/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
enum Page { product_info, product_details,product_review }
class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> colors = <String>[];
  List<String> selectedSizes = <String>[];
  Page _selectedPage = Page.product_info;
  final _key = GlobalKey<ScaffoldState>();
  String _color = "";
  String _size = "";

  // MaterialColor active = Colors.red;
  // MaterialColor notActive = Colors.transparent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _color = widget.product.colors[0];
    _size = widget.product.sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      body: SafeArea(
          child: Container(
            color: Colors.white.withOpacity(0.9),
            child: Stack(
              children: <Widget>[
                ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProductImage( imageurl:widget.product.picture,tag:widget.product.id)));
                      },
                      child: Hero(
                        tag: widget.product.id,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.product.picture,
                          fit: BoxFit.fill,
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          child: OutlineButton(
                              borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                              onPressed: () async {

                              },
                              //child: _displayChild1()
                            child: Container(
                              width: 80,
                              child:  FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: widget.product.picture,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                )
                            ),
                          ),
                        ),

                        Expanded(
                          child: OutlineButton(
                              borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                              onPressed: () async {

                              },
                              //child: _displayChild2()
                            child: Container(
                                width: 80,
                                child:  FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: widget.product.picture,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                )
                            ),
                          ),
                        ),

                        Expanded(
                          child: OutlineButton(
                            borderSide: BorderSide(color: grey.withOpacity(0.5), width: 2.5),
                            onPressed: () async {
                            },
                            //child: _displayChild3(),
                            child: Container(
                                width: 80,
                                child:  FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: widget.product.picture,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() => _selectedPage = Page.product_info);
                        },
                        color:  _selectedPage == Page.product_info ? Colors.red : Colors.transparent,
                        elevation: 0.0,
                        child: Text(
                          "Products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:  _selectedPage == Page.product_info ?  Colors.white : Colors.red,
                              fontWeight: FontWeight.bold,),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() => _selectedPage = Page.product_details);
                        },
                        color:  _selectedPage == Page.product_details ?  Colors.red : Colors.transparent,
                        elevation: 0.0,
                        child: Text(
                          "Details",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedPage == Page.product_details ?  Colors.white : Colors.red,
                            fontWeight: FontWeight.bold,),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() => _selectedPage = Page.product_review);
                        },
                        color: _selectedPage == Page.product_review ?  Colors.red : Colors.transparent,
                        elevation: 0.0,
                        child: Text(
                          "Review",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedPage == Page.product_review ?  Colors.white : Colors.red,
                            fontWeight: FontWeight.bold,),
                        ),
                      ),


                    ],
                  ),
                  Container(
                    child: _loadScreen(widget.product),
                  ),
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_basket_rounded),
                        Text("Related Products",style: TextStyle(fontWeight:FontWeight.w900,fontSize: 18.0 ),)
                      ],
                    ) ,
                  ),
                  SizedBox(height: 30,)

                  // Stack(
                  //   children: <Widget>[
                  //     Positioned.fill(
                  //         child: Align(
                  //           alignment: Alignment.center,
                  //           child: Loading(),
                  //         )),
                  //     Center(
                  //       child: FadeInImage.memoryNetwork(
                  //         placeholder: kTransparentImage,
                  //         image: widget.product.picture,
                  //         fit: BoxFit.fill,
                  //         height: 40,
                  //         width: double.infinity,
                  //       ),
                  //     ),
                  //     Align(
                  //       alignment: Alignment.topCenter,
                  //       child: Container(
                  //           height: 100,
                  //           decoration: BoxDecoration(
                  //             // Box decoration takes a gradient
                  //             gradient: LinearGradient(
                  //               // Where the linear gradient begins and ends
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               // Add one stop for each color. Stops should increase from 0 to 1
                  //               colors: [
                  //                 // Colors are easy thanks to Flutter's Colors class.
                  //                 Colors.black.withOpacity(0.7),
                  //                 Colors.black.withOpacity(0.5),
                  //                 Colors.black.withOpacity(0.07),
                  //                 Colors.black.withOpacity(0.05),
                  //                 Colors.black.withOpacity(0.025),
                  //               ],
                  //             ),
                  //           ),
                  //           child: Padding(
                  //               padding: const EdgeInsets.only(top: 8.0),
                  //               child: Container())),
                  //     ),
                  //     Align(
                  //       alignment: Alignment.bottomCenter,
                  //       child: Container(
                  //           height: 400,
                  //           decoration: BoxDecoration(
                  //             // Box decoration takes a gradient
                  //             gradient: LinearGradient(
                  //               // Where the linear gradient begins and ends
                  //               begin: Alignment.bottomCenter,
                  //               end: Alignment.topCenter,
                  //               // Add one stop for each color. Stops should increase from 0 to 1
                  //               colors: [
                  //                 // Colors are easy thanks to Flutter's Colors class.
                  //                 Colors.black.withOpacity(0.8),
                  //                 Colors.black.withOpacity(0.6),
                  //                 Colors.black.withOpacity(0.6),
                  //                 Colors.black.withOpacity(0.4),
                  //                 Colors.black.withOpacity(0.07),
                  //                 Colors.black.withOpacity(0.05),
                  //                 Colors.black.withOpacity(0.025),
                  //               ],
                  //             ),
                  //           ),
                  //           child: Padding(
                  //               padding: const EdgeInsets.only(top: 8.0),
                  //               child: Container())),
                  //     ),
                  //     Positioned(
                  //         bottom: 0,
                  //         child: Container(
                  //           width: MediaQuery.of(context).size.width,
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: <Widget>[
                  //               Padding(
                  //                 padding: const EdgeInsets.all(10.0),
                  //                 child: Text(
                  //                   widget.product.name,
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.w300,
                  //                       fontSize: 20),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(10.0),
                  //                 child: Text(
                  //                   '\$${widget.product.price / 100}',
                  //                   textAlign: TextAlign.end,
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 26,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         )),
                  //     Positioned(
                  //       right: 0,
                  //       child: Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: InkWell(
                  //           onTap: () {
                  //             changeScreen(context, CartScreen());
                  //           },
                  //           child: Padding(
                  //               padding: const EdgeInsets.all(4),
                  //               child: Card(
                  //                 elevation: 10,
                  //                 shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(20)),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: Icon(Icons.shopping_cart),
                  //                 ),
                  //               )),
                  //         ),
                  //       ),
                  //     ),
                  //     Positioned(
                  //       top: 120,
                  //       child: Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: InkWell(
                  //           onTap: () {
                  //             print("CLICKED");
                  //             Navigator.pop(context);
                  //           },
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //                 color: red,
                  //                 borderRadius: BorderRadius.only(
                  //                     bottomRight: Radius.circular(35))),
                  //             child: Padding(
                  //                 padding: const EdgeInsets.all(4.0),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.all(12),
                  //                   child: Icon(
                  //                     Icons.close,
                  //                     color: Colors.white,
                  //                   ),
                  //                 )),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(20),
                  //           topRight: Radius.circular(20),
                  //         ),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.black,
                  //               offset: Offset(2, 5),
                  //               blurRadius: 10)
                  //         ]),
                  //     child: Column(
                  //       children: <Widget>[
                  //         Padding(
                  //           padding: const EdgeInsets.all(0),
                  //           child: Row(
                  //             children: <Widget>[
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(horizontal: 8),
                  //                 child: CustomText(
                  //                   text: "Select a Color",
                  //                   color: white,
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(horizontal: 8),
                  //                 child: DropdownButton<String>(
                  //                     value: _color,
                  //                     style: TextStyle(color: white),
                  //                     items: widget.product.colors
                  //                         .map<DropdownMenuItem<String>>(
                  //                             (value) => DropdownMenuItem(
                  //                             value: value,
                  //                             child: CustomText(
                  //                               text: value,
                  //                               color: red,
                  //                             )))
                  //                         .toList(),
                  //                     onChanged: (value) {
                  //                       setState(() {
                  //                         _color = value;
                  //                       });
                  //                     }),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(0),
                  //           child: Row(
                  //             children: <Widget>[
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(horizontal: 8),
                  //                 child: CustomText(
                  //                   text: "Select a Size",
                  //                   color: white,
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(horizontal: 8),
                  //                 child: DropdownButton<String>(
                  //                     value: _size,
                  //                     style: TextStyle(color: white),
                  //                     items: widget.product.sizes
                  //                         .map<DropdownMenuItem<String>>(
                  //                             (value) => DropdownMenuItem(
                  //                             value: value,
                  //                             child: CustomText(
                  //                               text: value,
                  //                               color: red,
                  //                             )))
                  //                         .toList(),
                  //                     onChanged: (value) {
                  //                       setState(() {
                  //                         _size = value;
                  //                       });
                  //                     }),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Text(
                  //                 'Description:\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s  Lorem Ipsum has been the industry standard dummy text ever since the 1500s ',
                  //                 style: TextStyle(color: Colors.white)),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(9),
                  //           child: Material(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               color: Colors.white,
                  //               elevation: 0.0,
                  //               child: MaterialButton(
                  //                 onPressed: () async {
                  //                   appProvider.changeIsLoading();
                  //                   bool success = await userProvider.addToCart(
                  //                       product: widget.product,
                  //                       color: _color,
                  //                       size: _size);
                  //                   if (success) {
                  //                     _key.currentState.showSnackBar(
                  //                         SnackBar(content: Text("Added to Cart!")));
                  //                     userProvider.reloadUserModel();
                  //                     appProvider.changeIsLoading();
                  //                     return;
                  //                   } else {
                  //                     _key.currentState.showSnackBar(SnackBar(
                  //                         content: Text("Not added to Cart!")));
                  //                     appProvider.changeIsLoading();
                  //                     return;
                  //                   }
                  //                 },
                  //                 minWidth: MediaQuery.of(context).size.width,
                  //                 child: appProvider.isLoading
                  //                     ? Loading()
                  //                     : Text(
                  //                   "Add to cart",
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(
                  //                       color: Colors.black,
                  //                       fontWeight: FontWeight.bold,
                  //                       fontSize: 20.0),
                  //                 ),
                  //               )),
                  //         ),
                  //         SizedBox(
                  //           height: 20,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(35))),
                          child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeScreen(context, CartScreen());
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.shopping_cart),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
          )),
      bottomNavigationBar: Container(
        child:  Padding(
            padding: const EdgeInsets.all(9),
            child: Container(
                decoration: BoxDecoration(
                  color: red.shade500,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          appProvider.changeIsLoading();
                          bool success = await userProvider.addToCart(
                              product: widget.product,
                              color: _color,
                              size: _size);
                          if (success) {
                            _key.currentState.showSnackBar(
                                SnackBar(content: Text("Added to Cart!")));
                            userProvider.reloadUserModel();
                            appProvider.changeIsLoading();
                            return;
                          } else {
                            _key.currentState.showSnackBar(SnackBar(
                                content: Text("Not added to Cart!")));
                            appProvider.changeIsLoading();
                            return;
                          }
                        },
                        child: appProvider.isLoading
                            ? Loading()
                            : Text(
                          "Add to cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
                            child: InkWell(
                              onTap: (){
                                Fluttertoast.showToast(msg: 'negative');
                              },
                              child: Container(
                                width: 24, height: 24, decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red.shade500,
                                    child: Text('-'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text('100',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
                            child: InkWell(
                              onTap: (){Fluttertoast.showToast(msg: 'positivr');},
                              child: Container(
                                width: 24, height: 24, decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red.shade500,
                                    child: Text('+'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
      ),
    );
  }
  Widget _loadScreen(ProductModel products) {
    final productProvider = Provider.of<ProductProviderAdmin>(context);
    switch (_selectedPage) {
      case Page.product_info:
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(products.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,2.0,8.0,2.0),
                      child:    Row(
                        children: [
                          Icon(Icons.star_rate,color: Colors.white,size: 15,),
                          Text("4.3",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w900),),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Rwf ${products.price}',style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.w900),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Rwf 100',style: TextStyle(
                          color: Colors.black54,
                          decoration:TextDecoration.lineThrough),),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2436 Sales"),
                )

              ],
            ),
            SizedBox(height: 20,),
            Card(
              color: Colors.white,
              elevation: 0.8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,20.0,8.0,8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select Color',style: TextStyle(fontWeight: FontWeight.bold),),
                        InkWell(
                          onTap: (){},
                            child: Text('Clear All',style: TextStyle(fontWeight: FontWeight.bold),))
                      ],
                    ),
                  ),
                 Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            if(productProvider.selectedColors.contains('red')){
                              productProvider.removeColor('red');
                            }else{
                              productProvider.addColors('red');

                            }
                            setState(() {
                              colors = productProvider.selectedColors;
                            });
                          },
                          child: Container(width: 24, height: 24, decoration: BoxDecoration(
                              color: productProvider.selectedColors.contains('red') ? Colors.blue : grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                              ),
                            ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            if(productProvider.selectedColors.contains('yellow')){
                              productProvider.removeColor('yellow');
                            }else{
                              productProvider.addColors('yellow');

                            }
                            setState(() {
                              colors = productProvider.selectedColors;
                            });
                          },
                          child: Container(width: 24, height: 24, decoration: BoxDecoration(
                              color: productProvider.selectedColors.contains('yellow') ? red : grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow,
                              ),
                            ),),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            if(productProvider.selectedColors.contains('blue')){
                              productProvider.removeColor('blue');
                            }else{
                              productProvider.addColors('blue');

                            }
                            setState(() {
                              colors = productProvider.selectedColors;
                            });
                          },
                          child: Container(width: 24, height: 24, decoration: BoxDecoration(
                              color: productProvider.selectedColors.contains('blue') ? red : grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                              ),
                            ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            if(productProvider.selectedColors.contains('green')){
                              productProvider.removeColor('green');
                            }else{
                              productProvider.addColors('green');

                            }
                            setState(() {
                              colors = productProvider.selectedColors;
                            });
                          },
                          child: Container(width: 24, height: 24, decoration: BoxDecoration(
                              color: productProvider.selectedColors.contains('green') ? red : grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                              ),
                            ),),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            if(productProvider.selectedColors.contains('white')){
                              productProvider.removeColor('white');
                            }else{
                              productProvider.addColors('white');

                            }
                            setState(() {
                              colors = productProvider.selectedColors;
                            });
                          },
                          child: Container(width: 24, height: 24, decoration: BoxDecoration(
                              color: productProvider.selectedColors.contains('white') ? red : grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor: white,
                              ),
                            ),),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            if(productProvider.selectedColors.contains('black')){
                              productProvider.removeColor('black');
                            }else{
                              productProvider.addColors('black');

                            }
                            setState(() {
                              colors = productProvider.selectedColors;
                            });
                          },
                          child: Container(width: 24, height: 24, decoration: BoxDecoration(
                              color: productProvider.selectedColors.contains('black') ? red : grey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor: black,
                              ),
                            ),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Card(
              elevation: 1.0,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,20.0,8.0,8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select Size',style: TextStyle(fontWeight: FontWeight.bold),),
                        InkWell(
                            onTap: (){},
                            child: Text('Clear All',style: TextStyle(fontWeight: FontWeight.bold),))
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Checkbox(
                                value: selectedSizes.contains('XS'),
                                onChanged: (value) => changeSelectedSize('XS')),
                            Text('XS'),
                            Checkbox(
                                value: selectedSizes.contains('S'),
                                onChanged: (value) => changeSelectedSize('S')),
                            Text('S'),
                            Checkbox(
                                value: selectedSizes.contains('M'),
                                onChanged: (value) => changeSelectedSize('M')),
                            Text('M'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[

                            Checkbox(
                                value: selectedSizes.contains('L'),
                                onChanged: (value) => changeSelectedSize('L')),
                            Text('L'),
                            Checkbox(
                                value: selectedSizes.contains('XL'),
                                onChanged: (value) => changeSelectedSize('XL')),
                            Text('XL'),
                            Checkbox(
                                value: selectedSizes.contains('XXL'),
                                onChanged: (value) => changeSelectedSize('XXL')),
                            Text('XXL'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(height: 20,),


          ],
        );
        break;
      case Page.product_details:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Flexible(
                  child: Text(products.description,
                                )),
            ),
        ],
        );
        break;

      case Page.product_review:
        return Column(
          children:  <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.rate_review),
                  Text('Product Reviews',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:   Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children:[
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person,color: Colors.white,),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 200,
                                  child: Flexible(child: Text('Ngendahimana Eric',style: TextStyle(fontWeight: FontWeight.bold),)),

                                ),
                                Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Icon(Icons.date_range_rounded),
                                      Text('2021-03-10',style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                      ]),
                      SizedBox(height: 10,),
                      Container(
                      width: MediaQuery.of(context).size.width,
                        child: Flexible(
                          child: Text('Description:Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                              'Lorem Ipsum has been the industry standard dummy text ever since the 1500s  Lorem Ipsum has been'
                              ' the industry standard dummy text ever since the 1500s ',
                                        ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
        break;
      default:
        return Container();
    }
  }
  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }


}
