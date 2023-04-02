import 'package:flutter/material.dart';

class OnBoardingPage1 extends StatefulWidget {
  const OnBoardingPage1({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage1> createState() => _OnBoardingPage1State();
}

class _OnBoardingPage1State extends State<OnBoardingPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/book-read2.png",
                  height: 300,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Readers are the leaders",
                  style: TextStyle(
                    color: Color(0xff39425F),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 40,),
                const Text(
                  "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff39425F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 70,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed('onBoarding_page2');
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        color: Color(0xff39425F), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
