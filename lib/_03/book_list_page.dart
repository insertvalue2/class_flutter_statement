import 'package:flutter/material.dart';
import '../common.utils/logger.dart';
import 'inherited_parent.dart';

class BookListPage extends StatelessWidget {
  BookListPage({super.key});

  // 임시 데이터 - 교보문고에 볼 수 책 목록 리스트
  final List<String> books = [
    '호모사피엔스',
    '다트입문',
    '홍길동전',
    '코드리팩토링',
    '전치사도감',
  ];

  @override
  Widget build(BuildContext context) {
    // BuildContext 를 사용하여 우리가
    // 정의한 InheritedParent 위젯에 접근할 수 있다.

    InheritedParent? inheritedParent =
        context.dependOnInheritedWidgetOfExactType();

    // 공유 상태 데이터 -> 즉, 카트에 넣어둔 String 값을 가지고 와야 한다.
    List<String> selectedBook = inheritedParent?.state ?? [];

    // logger.d('데이터 확인 : ${selectedBook.toString()}');

    return inheritedParent == null
        ? Center(child: Text('데이터가 없네요'))
        : ListView(
            children: books.map(
              // book <-- books 에 0인덱스는 '호모사피엔스';
              (book) {
                // 함수에 바디에는 식을 작성할 수 있다.
                // 장바구에 유무을 어떻게 확인하지???
                // 부모가 관리하는 장바구니 데이터에 book 이란 데이터가
                // 있는가 없는가 체크 하고자 한다면?
                final isSelectedBook = selectedBook.contains(book);
                return ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    book,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      // 부모에게 콜백을 호출하는데 데이터도 함께 전달 시킨다.
                      inheritedParent.onPressed(book);
                      //onToggleSaved(book);
                    },
                    icon: Icon(
                      // isSelectedBook --> map 안에 지역 변수
                      isSelectedBook ? Icons.remove_circle : Icons.add_circle,
                      color: isSelectedBook ? Colors.red : Colors.green,
                    ),
                  ),
                );
              },
            ).toList(),
          );
  }
}
