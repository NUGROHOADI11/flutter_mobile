import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:modul/controller/product_controller.dart';

class ExploreScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http"),
      ),
      body: Column(
        children: [
          // Horizontal Scrollable List View
          Container(
            height: 200,
             // Set the desired height
            child: Obx(() {
              if (productController.products.isEmpty) {
                if (productController.products.length == 0) {
                  productController.fetchProducts();
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 2.0,

                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 150.0, // Adjust the width as needed
                            height: 150.0, // Adjust the height as needed
                            child: Image.network(
                              productController.products[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              productController.products[index].title,
                              overflow: TextOverflow
                                  .ellipsis, // Wraps text if it's too long
                              maxLines:
                                  2, // Adjust the number of lines to display
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ),
// Staggered Grid View (as shown in the previous response)
          Expanded(
            child: Obx(() {
              if (productController.products.isEmpty) {
                if (productController.products.length == 0) {
                  productController.fetchProducts();
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4, // Adjust as needed
                  itemCount: productController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Build your staggered grid view items here
                    return Card(
                      elevation: 2.0,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150.0,
                            child: Image.network(
                              productController.products[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            productController.products[index].title,
                            overflow: TextOverflow
                                .ellipsis, // Wraps text if it's too long
                            maxLines:
                                2, // Adjust the number of lines to display
                          ),
                        ],
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) {
                    // Define the tile size here
                    return StaggeredTile.count(2, index.isEven ? 2 : 1);
                  },
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
