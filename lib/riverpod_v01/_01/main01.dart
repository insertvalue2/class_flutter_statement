import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_statement_v01/common.utils/logger.dart';
import 'todo.dart';

void main() {
  // 1. Riverpod을 사용하기 위해 ProviderScope로 감싼다.
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(),
    );
  }
} // end of MyApp

// 2. 위젯을 ConsumerWidget으로 만들어 주면 ProviderScope에 접근할 수 있게 된다.
class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  // 3. ConsumerWidget 클래스의 build 메서드는 WidgetRef를 참조할 수 있다.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 4. ref 를 통해서 ProvdierScope 관리하는 창고 또는 창고가 관리하는 데이터에 접근할 수 있다.
    // 5. ref.read()는 메서드를 사용할 수 있다. - 창고에 직접 접근하거나 또는 상태값을 한번만 수신할 때 사용한다.
    // 6. ref.watch()는 상태값이 변경되는 것을 계속 수신할 때 사용한다 (구독)
    // 7. 이번 예제에서는 창고 관리자(여러명 중) Provider 라는 창고 관리자를 사용했다 (1회성 데이터 제공) - 알바생
    Todo todo = ref.read(todoProvider);
    logger.d('Todo 데이터 확인 : ${todo.toString()}');
    return Scaffold(
      body: Center(
        child: Text('완료 ${todo.isCompleted}, 내용 : ${todo.description}'),
      ),
    );
  }
}
