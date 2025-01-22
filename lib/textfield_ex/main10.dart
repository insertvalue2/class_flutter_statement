import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController 를 사용하여 텍스트 필드의 입력값을 제어
  final username = TextEditingController();
  final password = TextEditingController();
  final scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: ListView(
                controller: scroll,
                shrinkWrap: true, // 자식 컨텐츠 높이만큼 ListView 높이를 잡아준다.
                children: [
                  Container(
                    color: Colors.yellow,
                    height: 700,
                  ),
                  TextFormField(
                    onTap: () async {
                      print('username textfield');
                      // 스크롤을 최하단으로 이동
                      await Future.delayed(Duration(seconds: 2));
                      scroll.jumpTo(scroll.position.maxScrollExtent);
                    },
                    controller: username,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 2000));
                      scroll.jumpTo(scroll.position.maxScrollExtent);
                      print('password textfield');
                    },
                    controller: username,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('로그인')),
            )
          ],
        ),
      ),
    );
  }
}
