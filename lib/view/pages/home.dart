import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul/controller/home_controller.dart';
import 'package:modul/view/pages/dashboard_screen.dart';
import 'package:modul/view/pages/explore_screen.dart';
import 'package:modul/view/pages/home_screen.dart';
import 'package:modul/view/pages/profile_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final navBarItems = const [
      TabItem(icon: Icons.home, title: ''),
      TabItem(icon: Icons.explore, title: ''),
      TabItem(icon: Icons.dashboard, title: ''),
      TabItem(icon: Icons.person, title: ''),
    ];

    final navBarBody = [
      HomePage(),
      ExploreScreen(),
      DashboardScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(child: navBarBody[controller.currentNavIndex.value]),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: navBarItems,
        initialActiveIndex: 0,
        top: -20,
        height: 50,
        style: TabStyle.react,
        backgroundColor: Color(0xff262837),
        onTap: (int i) {
          controller.currentNavIndex.value = i;
        },
      ),
    );
  }
}
