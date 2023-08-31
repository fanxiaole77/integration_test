
import 'package:flutter/material.dart';

class HoemPage extends StatefulWidget {

  final String email;
  HoemPage({required this.email});

  @override
  _HoemPageState createState() => _HoemPageState();
}

class _HoemPageState extends State<HoemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/tu2.jpeg"),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height -  20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(20),
                  topRight:Radius.circular(20),
                )
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/tu2.jpeg"),
                    radius: 40,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text("欢迎${widget.email}来到AI的对面",),
                            Text("现在有什么能帮到你的",),
                            
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
