import 'package:flutter/material.dart';

class BookCartPage extends StatelessWidget {
  // 사용자가 카드에 저장한 데이터만 화면에 뿌려 주자.
  final List<String> mySelectedBooks;

  const BookCartPage({required this.mySelectedBooks, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: mySelectedBooks
            .map((book) => ListTile(title: Text(book)))
            .toList());
  }
}
