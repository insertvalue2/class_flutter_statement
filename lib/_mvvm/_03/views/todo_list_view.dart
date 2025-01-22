import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';
import 'package:flutter_statement_v01/_mvvm/_03/view_models/todo_list_view_model.dart';

// view
class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  // 뷰는 뷰 모델만 바라보면 된다.
  TodoListViewModel _listViewModel = TodoListViewModel();
  TextEditingController _controller = TextEditingController();

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
                      _listViewModel.addItem(_controller.text);
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
              itemCount: _listViewModel.items.length,
              itemBuilder: (context, index) {
                final TodoItem item = _listViewModel.items[index];
                return ListTile(
                  title: Text(item.title),
                  trailing: Checkbox(
                    value: item.isDone,
                    onChanged: (value) {
                      _listViewModel.toggleItem(item);
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
