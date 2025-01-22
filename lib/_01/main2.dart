import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyStatefulWidget(),
  ));
}

//////////////////////
// 포인트 !
// 사실 상태는 변수에 할달된 값이다. 상태가 있다라는 말은
// 값을이 변화할 수 있는 가능성을 이야기 한다.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // 변수 ---고정 --> 상수
  final msg = '저는 stateful 위젯입니다.';

  // 변수에 할당된 값이 상수가 아니기 때문에 언제든지 변경이 가능하다.
  // 즉, 여기를 상태변수라고 부른다.
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Text('${widget.msg} onTap Count : ${widget.count}'),
        child: InkWell(
          onTap: () {
            setState(() {
              count += 1;
            });
          },
          child: Text('${msg} onTap Count : ${count}'),
        ),
      ),
    );
  }
}
/////////////////////////////////
