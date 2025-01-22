import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/riverpod_v01/_02/fruit.dart';

import '../../common.utils/logger.dart';

void main() {
  // 1. Riverpod을 사용하기 위해서 ProviderScope로 감싼다.
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FruitPage(),
    );
  }
} // end of Myapp

// 2. 리버팟을 사용하기 위해서 소비자 ConsumerWidget 변경해야 한다.
class FruitPage extends ConsumerWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.d(" FruitPage Build() 함수 호출 확인");
    // 사용하는 측 코드에서 배운 2가지
    // ref.read(....), ref.watch(....)
    // 한번만 데이터를 가져올려면 무엇을 사용해야 할까?
    //String getFruit = ref.read(fruitProvider);
    String getFruit = ref.watch(fruitProvider); // 상태 변경이 되면 계속 알림을 받아요
    logger.d("getFruit 확인 : ${getFruit}");
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('data 확인 : ${getFruit}'),
              ElevatedButton(
                onPressed: () {
                  // 상태 변경 기능은 누가 들고 있을까?
                  // 데이터를 가지고 오는게 아니라 창고 자체를 들고 와서 그 안에
                  // 머신을 동작 시켜야 한다.
                  // read() 메서는 데이터를 한번 들고 오기도 하지만 창고 자체에 접근 시킬 수 있다.
                  // 창고 자체에 접근 했다.
                  FruitStore fruitStore = ref.read(fruitProvider.notifier);
                  fruitStore.changeData("딸기");
                },
                child: Text('딸기로 상태 변경하기'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/**
 *  정리
 *  Provider (01 예제) - 1회 알바생
 *  - 데이터를 단순히 한 번 제공하는 역할, 상태가 변하지 않는 데이를 관릴할 때 사용하며
 *    즉, 주로 정적인 데이터를 제공할 때 사용한다.
 *    (단순 문자열, 정적 객체 등)
 *
 *  StateNotifierProvider(02 예제) - 창고 관리자이다.
 *  - 상태를 관리(state) 변경할 수 있는 창고 관리자 역할이다.
 *    상태(state)가 변경이 되면 이를 구독(watch)중인 모든 위젯에게 알려준다.
 *    ref.read() 창고(FruitStore) 자체 접근할 수 있고,
 *    ref.watch() 계속 구독하여 상태 변경을 감지 할 수 있다.
 *
 */
