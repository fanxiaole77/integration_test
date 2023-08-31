import 'dart:async';

import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;

  bool isSize = false;

  double _left = 50.0;
  double _top = 20.0;


  List<String> imagePage = [
    "images/tu1.jpeg",
    "images/tu2.jpeg",
    "images/tu3.jpeg",
  ];

  int currentIndex = 0;
  Timer ?_timer;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    startBanner();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController.dispose();
  }

  void startBanner(){
    _pageController = PageController(initialPage: currentIndex);
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if(currentIndex < imagePage.length -1){
        currentIndex++;
      }else{
        currentIndex = 0;
      }
      _pageController.animateToPage(currentIndex, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void onTab(){
    setState(() {
      isSize = !isSize;
    });
  }

  double _initialSize = 200.0;
  double _initialAngle = 200.0;
  double Size = 200.0;
  double angle = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: PageView.builder(
              itemCount: imagePage.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return Image.asset(
                  imagePage[index],
                  fit: BoxFit.fill,
                );

              },
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              GestureDetector(
                onLongPress: (){
                  onTab();
                },
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: isSize?200:100,
                    height: isSize?200:100,
                    color: isSize?Colors.green:Colors.yellow
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              GestureDetector(
                onScaleStart: (_){
                  _initialSize = Size;
                  _initialAngle = angle;
                },
                  onScaleUpdate: (details){
                  setState(() {
                    Size = _initialSize * details.scale;
                    angle = _initialAngle + details.rotation;
                  });
                  },
                child: Transform.rotate(angle: angle,child: Icon(Icons.cloud,size: Size,),)
              )
            ],
          ),

        ],
      )
    );
  }
}
