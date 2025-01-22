import 'package:flutter/material.dart';

void main() {
  runApp(MyApp02());
}

class MyApp02 extends StatelessWidget {
  const MyApp02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

// viewModel
class HomeViewModel {
  int _counter = 0;
  // getter
  int get counter => _counter;

  // 데이터를 변경하는 기능도 뷰 모델이 가진다.
  void incrementCounter() {
    _counter++;
  }
}

// View
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 뷰는 뷰 모델만 바라보면 된다.
  // 콤포지션 관계 - 내부에서 객체를 생성 --> 강한 소유에 관계이다.
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('뷰 모델이없는 코드를 작성중...'),
      ),
      body: Column(
        children: [
          Text(
            '${homeViewModel.counter}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // 프레젠테이션 로직
              setState(() {
                // 비지니스 로직
                homeViewModel.incrementCounter();
              });
            },
            child: Text('increment'),
          )
        ],
      ),
    );
  }
}
