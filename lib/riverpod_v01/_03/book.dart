// 1. 창고 안에 들어갈 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

String myBook = '흐르는강물처럼';

// 2. 창고를 만들자 (창고를 만들 때 규격이 있다)
class MyBookStore extends StateNotifier<String> {
  // super.state 는 부모 클래스 state 변수에 등록 시키는 코드이다.
  MyBookStore(super.state);

  // 창고안에 상품을 변경시킬 수 있는 머신 만들기
  void changeData(String book) {
    state = book;
  }
}

// 3. 창고 관리자를 만들어 주자
final myBookStoreProvider = StateNotifierProvider<MyBookStore, String>(
  (ref) => MyBookStore(myBook),
);
