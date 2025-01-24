// viewModel
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_item.dart';

// 1. 뷰 모델을 사용하고 있다.
// 2. 뷰 모델에 날개를 달아 주자 (riverpod 상태관리 기능 추가)
// 3. 우리에 규칙 뷰 모델 - 창고에 역할도 한다
// 4. get,set 사용지 말자
class TodoListViewModel extends Notifier<List<TodoItem>> {
  // List<TodoItem> _items = [];

  @override
  List<TodoItem> build() {
    return [];
  }

  // 비즈니스 로직
  void addItem(String title) {
    // state.add <-- 원래 사용하는고 있는 객체에 접근해서 추가 했더니
    // 위젯이 변경이 안되었다. 하지만 새로운 객체를 만들어서 할당 하니
    // 위젯 변경이 일어났다.
    state = [...state, TodoItem(title: title)];
  }

  // 0. 가변 객체를 변경해서 사용하는 코드
  // void toggleItem(TodoItem todo) {
  //   todo.isDone = !todo.isDone;
  // }

  // 조금 어려움 아니 쉬움
  // 상태관리를 다룰 때 불변 객체, 가변 객체란?
  // 1 단계 코드 - 불변 객체 할당
  // void toggleItem(TodoItem todo) {
  //   state = [
  //     for (final item in state)
  //       if (item == todo)
  //         TodoItem(
  //           title: item.title,
  //           isDone: !item.isDone,
  //         )
  //       else
  //         item
  //   ];
  // }

  // 2단계 코드
  void toggleItem(TodoItem todo) {
    state = state
        .map(
            (item) => item == todo ? item.copyWith(isDone: !item.isDone) : item)
        .toList();
  }

  // 불변성 원칙 위배(버그 위험 증가)
  // 기존 리스트의 참조를 유지한 채, 리스트 안에 특정 객체의 속성을 직접 수정하는 것
  // flutter 상태 관리에서는 가변 객체 대신 불변객체를 사용한다.
}

// 3. 창고 관리자를 만들고 관리할 창고를 설정해주자
final todoListViewModelProvider =
    NotifierProvider<TodoListViewModel, List<TodoItem>>(
  () {
    return TodoListViewModel();
  },
);
