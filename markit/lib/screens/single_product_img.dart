import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ViewProductImage extends StatefulWidget {
  final String imageurl;
  final String tag;


  const  ViewProductImage({this.imageurl, this.tag});

  @override
  _ViewProductImageState createState() => _ViewProductImageState();
}

class _ViewProductImageState extends State<ViewProductImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:
      SafeArea(
        child: InteractiveViewer(
          child: Hero(
            tag: widget.tag,
            child: Container(
              alignment: Alignment.center,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.imageurl,
                fit: BoxFit.fill,
                width: double.infinity,
              ),

            ),
          ),
        ),
      ),
    );
  }
}
