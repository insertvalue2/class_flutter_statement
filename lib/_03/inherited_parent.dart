// InheritedWidget 내장 데이터 타입을 상속받아 구현한다.
import 'package:flutter/cupertino.dart';
import '../common.utils/logger.dart';

class InheritedParent extends InheritedWidget {
  // 공유 상태 데이터 관리에 목적
  // List<String> mySelectedBooks = [];
  final List<String> state; // 카드에 담긴 책 목록(공유 상태)
  // 부모에게 콜백 메서드를 관리하는 목적
  final void Function(String book) onPressed; // 이벤트 핸들러

  // HOW <-- 사용방법
  // WHY <---
  const InheritedParent({
    required this.state,
    required this.onPressed,
    required super.child,
  });

  // 상태가 변경되었는지 여부를 판단하는 메서드
  // 주의점 ! InheritedWidget --> 재정의 클래스를 InheritedParent 넣어 주자.

  // 메서드안 InheritedParent 타입 확인
  @override
  bool updateShouldNotify(covariant InheritedParent oldWidget) {
    logger.d('InheritedParent - updateShouldNotify() 호출 확인 ');

    // 상태가 달라졌다면 어떻게 판별할까?
    if (state.length != oldWidget.state.length) {
      logger.d('상태 변경 됨 ');
      return true;
    }

    for (int i = 0; i < state.length; i++) {
      // state --> String --> '호모사피엔스'
      // state[i] --> String ---> 호모사피엔스
      if (state[i] != oldWidget.state[i]) {
        return true;
      }
    }

    // 상태 변경이 없으면 false 를 반환하여 자식 위젯을 다시 빌드 않되도록 한다.
    return false; // 상태 변경 없음
  }
}
