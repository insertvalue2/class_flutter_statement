import 'package:flutter/material.dart';

void main() {
  runApp(MyApp01());
}

class MyApp01 extends StatelessWidget {
  const MyApp01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

// View
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 이 예제에서는 _counter 를 모델로 바라볼 수 있다.
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('뷰 모델이없는 코드를 작성중...'),
      ),
      body: Column(
        children: [
          Text(
            '${_counter}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Text('increment'),
          )
        ],
      ),
    );
  }
}
