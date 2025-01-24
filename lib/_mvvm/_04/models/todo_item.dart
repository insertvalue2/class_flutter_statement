// Model
// 1. 우리가 관리 하고 싶은 데이터 (창고 안에 넣을 상품)
class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});

  // 2단계 코드 시작
  TodoItem copyWith({String? title, bool? isDone}) {
    return TodoItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
