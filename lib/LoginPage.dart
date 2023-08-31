import 'package:demo1/HomePage.dart';
import 'package:demo1/agree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isAgree = false;

  void toast(BuildContext context) {
    if (isAgree == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("请您阅读并同意")),
      );
    }else if(isAgree == true){
      login();
    }
  }

  void login(){
    if(username.text.contains("@") && password.text.toString().length == 6){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HoemPage(
        email: username.text,
      ),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("账号或密码错误")),
      );
    }
  }

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
          child:Card(
            child: Container(
              width: 300,
              height: 500,
              child:Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("myAI",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("为您呈现精彩世界",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    child: TextField(
                      controller: username,
                      key:ValueKey("username"),
                      decoration: InputDecoration(
                        hintText: "用户邮箱",
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 250,
                    height: 40,
                    child: TextField(
                      controller: password,
                      key:ValueKey("password"),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "密码",
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      if(isAgree == true){
                        print("跳转");
                        toast(context);
                      }else{
                        print("失败");
                        toast(context);
                      }
                    },
                    child: Container(
                      key: ValueKey("login"),
                      width: 250,
                      height: 45,
                      decoration:BoxDecoration(
                        color:isAgree  == true?Colors.blue:Colors.blue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("开启智能世界"),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("请您阅读并同意"),
                      TextButton(onPressed: (){
                        setState(() {
                          isAgree =  true;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Agree(),));
                      }, child: Text("用户协议"),key: ValueKey("userbutton"),)
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
