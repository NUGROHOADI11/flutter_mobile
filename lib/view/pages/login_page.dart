import 'package:flutter/material.dart';
import 'package:modul/view/pages/home.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const TextField(
              keyboardType: TextInputType.emailAddress,
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange[800], // Change the button color to green
              ),
              child: const Text("Login"),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(
                  child: Text(
                    "Don't have any account?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
