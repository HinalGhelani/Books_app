import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_books_app/screens/books_page.dart';
import 'package:firebase_books_app/screens/detail_page.dart';
import 'package:firebase_books_app/screens/explore_page.dart';
import 'package:firebase_books_app/screens/first_page.dart';
import 'package:firebase_books_app/screens/global.dart';
import 'package:firebase_books_app/screens/like_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  static List pages = [
    const FirstPage(),
    const ExplorePage(),
    const LikePage(),
    const BooksPage(),
  ];

  void onItemTap(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: (user.displayName == null)
            ? const Text(
                "Hello",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )
            : Text(
                "Hello ${user.displayName}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
        backgroundColor: const Color(0xffF4F4F4),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffECEAEB),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xff011049),
                width: 1,
              ),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                border: OutlineInputBorder(),
                enabledBorder: InputBorder.none,
                hintText: "Type to search",
                prefixIcon: Icon(
                  Icons.search,
                ),
                suffixIcon: Icon(Icons.mic),
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF4F4F4),
      body: pages.elementAt(index),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
          type: BottomNavigationBarType.shifting,
          iconSize: 25,
          selectedFontSize: 15,
          selectedItemColor: const Color(0xff39425F),
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: index,
          onTap: onItemTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey.shade500,
              ),
              activeIcon: const Icon(
                Icons.home_outlined,
                color: Color(0xff39425F),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore_outlined,
                  color: Colors.grey.shade500,
                ),
                activeIcon: const Icon(
                  Icons.explore_outlined,
                  color: Color(0xff39425F),
                ),
                label: "Explore"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.grey.shade500,
              ),
              activeIcon: const Icon(
                Icons.favorite_outline,
                color: Color(0xff39425F),
              ),
              label: "like",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_sharp,
                color: Colors.grey.shade500,
              ),
              activeIcon: const Icon(
                Icons.menu_book_sharp,
                color: Color(0xff39425F),
              ),
              label: "Books",
            ),
          ],
        ),
      ),
    );
  }
}
