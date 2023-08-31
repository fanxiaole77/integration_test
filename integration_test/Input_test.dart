import 'package:demo1/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

//创建测试程序
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //组测试
  group("测试1",(){
    //测试
    testWidgets("测试2",(tester) async {
      //控制台打印
      print("步骤号：Step No 1,动作描述：打开myAI App");
      //启动App
      await tester.pumpWidget(MyApp());
      //延迟10s


      //绑定key绑定对应控件
      final Finder username = find.byKey(ValueKey("username"));
      final Finder password = find.byKey(ValueKey("password"));
      final Finder userbutton = find.byKey(ValueKey("userbutton"));
      final Finder ty = find.byKey(ValueKey("ty"));
      final Finder login = find.byKey(ValueKey("login"));

      print("步骤号：Step No 2,动作描述：点击用户邮箱输入框，并输入usernmae");
      await tester.tap(username);//点击
      await tester.enterText(username, "username");//输入

      await tester.pumpAndSettle();

      print("步骤号：Step No 3,动作描述：点击密码输入框，并输入123ab");
      await tester.tap(password);
      await tester.enterText(password, "123ab");

      await tester.pumpAndSettle();

      print("步骤号：Step No 4,动作描述：点击用户协议文本按钮");
      await tester.tap(userbutton);
      await tester.pumpAndSettle();


      print("步骤号：Step No 5,动作描述：点击同意按钮");
      await tester.tap(ty);
      await tester.pumpAndSettle();


      print("步骤号：Step No 6,动作描述：点击登陆按钮");
      await tester.tap(login);
      await tester.pumpAndSettle();


      print("步骤号：Step No 7,动作描述：修改用户邮箱输入框内用，在结尾增加文本@gamil.com");
      await tester.tap(username);
      await tester.enterText(username, "username@gmail.com");
      await tester.pumpAndSettle();

      print("步骤号：Step No 8,动作描述：修改用户密码输入框内用，在结尾增加文本6");
      await tester.tap(password);
      await tester.enterText(password, "123ab6");
      expect(find.text("123ab6"), findsOneWidget);
      await tester.pumpAndSettle();


      print("步骤号：Step No 9,动作描述：点击登陆按钮");
      await tester.tap(login);
      await tester.pumpAndSettle();


      print("步骤号：Step No 10,动作描述：退出程序");



    });
  });
}

//flutter pub get -offline
//flutter test --on-pub integration_test