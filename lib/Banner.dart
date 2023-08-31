import 'dart:async';

import 'package:flutter/material.dart';

class Bannner extends StatefulWidget {
  const Bannner({Key? key}) : super(key: key);

  @override
  _BannnerState createState() => _BannnerState();
}

class _BannnerState extends State<Bannner> {

  List<String> imagePaths= [
    "images/tu1.jpeg",
    "images/tu2.jpeg",
    "images/tu3.jpeg",
  ];

  int _currentPage = 0;

  Timer ?_timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(imagePaths[index], fit: BoxFit.cover);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
