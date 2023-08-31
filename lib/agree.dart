
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Agree extends StatefulWidget {
  const Agree({Key? key}) : super(key: key);

  @override
  _AgreeState createState() => _AgreeState();
}

class _AgreeState extends State<Agree> {
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
        child: Center(
          child: Card(
            child: Container(
              width: 300,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("用户协议",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22
                  ),),
                  Container(
                    width: 250,
                    height: 250,
                    decoration:BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        Text("ahsdashkjdashjkdhajkshjkdashjksdhjkashjkda",style: TextStyle(fontSize: 54),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          SystemNavigator.pop();
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: Center(child: Text("不同意",style: TextStyle(color: Colors.white),),),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          key: ValueKey("ty"),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: Center(child: Text("同意",style: TextStyle(color: Colors.white),),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
