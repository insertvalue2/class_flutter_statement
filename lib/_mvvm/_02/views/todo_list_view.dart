import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  TextEditingController _controller = TextEditingController();

  // 샘플 데이터
  List<TodoItem> _todoItems = [
    TodoItem(title: '플러터공부'),
    TodoItem(title: '낮잠 자기', isDone: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter todo item...',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      // 추가 로직 넣을 예정
                      _todoItems.add(TodoItem(title: _controller.text));
                      _controller.clear();
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                final TodoItem item = _todoItems[index];
                return ListTile(
                  title: Text(item.title),
                  trailing: Checkbox(
                    value: item.isDone,
                    onChanged: (value) {
                      // item.isDone --> ture, false
                      // item.isDone = value ?? false;
                      item.isDone = !item.isDone;
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
