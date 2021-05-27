// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:markit/helpers/style.dart';
import 'package:markit/models/product.dart';
import 'package:markit/widgets/loading.dart';
import 'package:transparent_image/transparent_image.dart';

//enum Page { product_info, product_details,product_review }

//List<String> category_list = ["All", "Shirt", "Dress", "Shoes","Computers","Phones", "Watches", "Hats"];
class Categories extends StatefulWidget {
  final List<ProductModel> product;
  List<String> category_list;
 Categories({Key key, this.product,this.category_list}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String selectedPage ='All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.category_list.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: (){ setState(() =>selectedPage =widget.category_list[index] );},
                child: Card(
                  color: selectedPage == widget.category_list[index]?  Colors.red : Colors.white,
                  elevation: 2,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,2.0,8.0,2.0),
                    child: Center(
                        child: Text(
                          widget.category_list[index],
                          style: TextStyle(
                              color: selectedPage == widget.category_list[index]?  Colors.white: Colors.red,fontWeight: FontWeight.bold),
                            )),
                  ),
                ),
              );
            })
    ),
        _loadScreenWithCategories(widget.category_list)
      ],
    );

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
  Widget _loadScreenWithCategories(List<String> category_list) {
    //final productProvider = Provider.of<ProductProviderAdmin>(context);
    for(var i=0;i<widget.category_list.length;i++){
       if(selectedPage==category_list[i]){
         return  SingleCategoryPage();
       }
       else{
         return Container(
           child: Text(selectedPage),
         );
       }
    }

    }
  Widget SingleCategoryPage() {
    //final productProvider = Provider.of<ProductProviderAdmin>(context);
        return  GridView.builder(
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
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(

                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration
                                :TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child:Stack(
                    children: [
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Loading(),
                          )),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: prod_pricture,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      // Image.asset(
                      //   prod_pricture,
                      //   fit: BoxFit.cover,
                      // ),

                    ],

                  ),
              ),


            ),
          )),
    );
  }

}
// class CategoryListChoose extends StatefulWidget {
//   CategoryListChoose(List<String> cat_list);
//   List<String> cat_list;
//
//   @override
//   _CategoryListChooseState createState() => _CategoryListChooseState();
// }

// class _CategoryListChooseState extends State<CategoryListChoose> {
//   String selectedPage ='All';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 40,
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: widget.cat_list.length,
//             itemBuilder: (_, index) {
//               return InkWell(
//                 onTap: (){ setState(() =>selectedPage = );},
//                 child: Card(
//                   color: Colors.red,
//                   elevation: 2,
//                     shape: StadiumBorder(),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(8.0,2.0,8.0,2.0),
//                       child: Center(
//                           child: Text(
//                               widget.cat_list[index],
//                           style: TextStyle(color: Colors.white),)),
//                     ),
//                 ),
//               );
//             })
//     );
//   }
// }

