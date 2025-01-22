import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_03/inherited_parent.dart';

class BookCartPage extends StatelessWidget {
  // 사용자가 카드에 저장한 데이터만 화면에 뿌려 주자.

  const BookCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    InheritedParent inheritedParent =
        // ! 널이 절대 아님을 우리는 알고 있다.
        context.dependOnInheritedWidgetOfExactType<InheritedParent>()!;

    return ListView(
        children: inheritedParent.state
            .map((book) => ListTile(title: Text(book)))
            .toList());
  }
}
