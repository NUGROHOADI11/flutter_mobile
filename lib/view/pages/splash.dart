import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Where every flavor"
              "\ntells a story",
          body:
              "Welcome to our Food E-Commerce, where culinary delights are just a click away",
          image: Center(
            child: Lottie.asset(
              'assets/lotties/tudungsaji.json',
            ),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
            bodyTextStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ),
        PageViewModel(
          title: "Feeling Hungry?",
          body: "Discover a world of flavors, from the comfort of wherever you may be",
          image: Center(
            child: Lottie.asset(
              'assets/lotties/mbak2.json',
            ),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
            bodyTextStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ),
      ],
      showNextButton: true,
      done: const Text("Get Started", style: TextStyle(color: Colors.orange)),
      next: const Text("Next", style: TextStyle(color: Colors.orange)),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Colors.orange,
        color: Colors.white,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      onDone: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      globalBackgroundColor: Colors.black,
    );
  }
}
