import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul/controller/image_picker.dart';
import 'package:modul/view/pages/login_page.dart';
import 'package:modul/view/web/term.dart';

import '../../controller/checkbox.dart';

class SignUpPage extends StatelessWidget {
  final ImagePickerController controller = Get.put(ImagePickerController());
  final CheckboxController checkboxController = Get.put(CheckboxController());

  final bool isChecked = false;

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          height: height,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      foregroundImage: controller.imagePath.isNotEmpty
                          ? FileImage(File(controller.imagePath.toString()))
                          : null,
                      child: const Icon(
                        Icons.person_rounded,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.getImageCamera();
                      },
                      child: const Text(
                        'Camera',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.getImageGallery();
                      },
                      child: const Text(
                        'Galery',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.orange,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.orange,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.replay,
                      color: Colors.orange,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors
                        .white, // Set the color of the unselected Checkbox
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: checkboxController.isChecked.value,
                        activeColor: Colors.orange[800],
                        onChanged: (bool? newValue) {
                          checkboxController.isChecked.value =
                              newValue ?? false;
                        },
                      ),
                      const Text('I have read the',
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  const WebviewPage(),
                          ));
                        },
                        child: const Text(
                          'Term of service',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: checkboxController.isChecked.value
                      ? () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.grey,
                    backgroundColor: Colors.orange[800],
                    minimumSize: Size(width * 0.9, 40),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
