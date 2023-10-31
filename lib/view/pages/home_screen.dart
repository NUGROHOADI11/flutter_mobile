import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul/controller/product_controller.dart';
import '../../model/hotel_model.dart';

class HomePage extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel("assets/images/hotel1.jpg", "Hotel Surya", "\$800"),
    Hotel("assets/images/hotel2.jpg", "Hotel Ari", "\$100"),
  ];
  final ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Foodies",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.notifications, size: 30),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              height: height * 0.06,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: const Color(0xff2e2d35),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find your food",
                    hintStyle: GoogleFonts.dmSans(
                      color: Colors.white60,
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Category",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: width * 0.88,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.055,
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color(0xffffb94f),
                      ),
                      child: Center(
                        child: Text(
                          "Sushi",
                          style: GoogleFonts.dmSans(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.055,
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color.fromARGB(255, 140, 138, 138),
                      ),
                      child: Center(
                        child: Text(
                          "Burger",
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.055,
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color.fromARGB(255, 140, 138, 138),
                      ),
                      child: Center(
                        child: Text(
                          "Pizza",
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Featured Food",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Container(
              height: height * 0.325,
              width: width * 0.92,
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
                    shrinkWrap: true,
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01,
                        ),
                        child: SizedBox(
                          width: 220,
                          child: Card(
                            color: const Color.fromARGB(255, 32, 34, 45),
                            elevation: 0.4,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        productController.products[index].image,
                                        width: double.maxFinite,
                                        fit: BoxFit.cover,
                                        height: 140,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productController.products[index].title,
                                                style: GoogleFonts.dmSans(
                                                  fontSize: width * 0.04,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                productController.products[index].restaurantChain,
                                                style: GoogleFonts.dmSans(
                                                  fontSize: width * 0.038,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.green,
                                                ),
                                                overflow: TextOverflow.fade,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.bookmark,
                                          size: 25,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            const SizedBox(height: 15),
            const Text(
              "Recommendation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: height * 0.4,
              width: width * 0.9,
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
                    // scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: width * 0.01,
                        ),
                        child: Card(
                          color: const Color.fromARGB(255, 32, 34, 45),
                          elevation: 0.4,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      productController.products[index].image,
                                      width: width * 0.3,
                                      height: height * 0.15,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productController.products[index].title,
                                          style: GoogleFonts.dmSans(
                                            fontSize: width * 0.045,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          productController.products[index].restaurantChain,
                                          style: GoogleFonts.dmSans(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.bookmark,
                                    size: 25,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
